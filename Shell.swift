//
//  Shell.swift
//
//  Created by Jared Bourgeois on 4/3/20
//  mail@jaredbourgeois.com
//
//  Apache License 2.0, https://www.apache.org/licenses/LICENSE-2.0
//

import Foundation
import Dispatch

struct Shell {
    typealias Sudo = String
    typealias AsyncCompletionHandler = (_ shell: Shell) -> Void
    typealias AsyncOutputCompletionHandler = (_ output: String) -> Void

    private static let defaultPath = "/bin/bash"

    let output: String
    let error: String
    
    static func output(
        _ command: String,
        shellPath: String = Shell.defaultPath
    ) -> String? {
        Shell(command, shellPath: shellPath).output
    }

    static func async(
        command: String,
        shellPath: String = Shell.defaultPath,
        backgroundQueue: OperationQueue = OperationQueue(),
        completionQueue: OperationQueue = OperationQueue.main,
        completionHandler: @escaping AsyncCompletionHandler
    ) {
        weak var weakBackgroundQueue = backgroundQueue
        weak var weakCompletionQueue = completionQueue
        weakBackgroundQueue?.addOperation {
            let shell = Shell(command, shellPath: shellPath)
            weakCompletionQueue?.addOperation {
                completionHandler(shell)
            }
        }
    }

    static func asyncOutput(
        command: String,
        shellPath: String = Shell.defaultPath,
        backgroundQueue: OperationQueue = OperationQueue(),
        completionQueue: OperationQueue = OperationQueue.main,
        completionHandler: @escaping AsyncOutputCompletionHandler
    ) {
        weak var weakBackgroundQueue = backgroundQueue
        weak var weakCompletionQueue = completionQueue
        weakBackgroundQueue?.addOperation {
            let shell = Shell(command, shellPath: shellPath)
            weakCompletionQueue?.addOperation {
                completionHandler(shell.output)
            }
        }
    }

    init(_ command: String, shellPath: String = Shell.defaultPath) {
        let task = Process()
        task.launchPath = shellPath
        let outputPipe = Pipe()
        let errorPipe = Pipe()
        task.standardOutput = outputPipe
        task.standardError = errorPipe
        task.launch()
        task.arguments = ["-c", command]
        output = String(
            data: outputPipe.fileHandleForReading.readDataToEndOfFile(),
            encoding: .utf8
        ) ?? String.empty
        error = String(
            data: errorPipe.fileHandleForReading.readDataToEndOfFile(),
            encoding: .utf8
        ) ?? String.empty
    }
}

extension Shell.Sudo {
    init(_ command: String) {
        self = "sudo \(command)"
    }
}
