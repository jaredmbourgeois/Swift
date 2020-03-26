# Swift Common Library
## Jared Bourgeois
### https://jaredbourgeois.com
### mail@jaredbourgeois.com

### Apache License 2.0 https://www.apache.org/licenses/LICENSE-2.0

## Extensions
### An open source collection of my extensions. I usually default to extending a native class for basic functionality and keep them here.
- many `NSManagedObject` and other `CoreData` extensions, notably generic object search with simpler `NSPredicate` formatting API

## Font.swift
### A simple, light-weight `UIFont` wrapper that creates a nicer (IMHO), unified API for iOS system fonts.
- since every font (family) has different customization options, each font must be manually implemented and there will almost always be some redundancy in the type system
- I've only implemented a few system fonts, but if anyone wants to use this and adapts it for more, it'd be greatly appreciated if you put in a PR :)

## Format.swift
### UI formatting structures that uses unified size "classes" (eg `.small`, `.medium`, `.large`) of `Height` (eg button, label, row), `Inset`, `CornerRadius`, etc

## TimePeriod.swift
- Unified time model that uses a combination of `Date`, `Calendar`, `Calendar.Components`, etc
- `TimerPeriod(_ timeInterval: TimeInterval)` returns a light-weight `struct` that can return calendar components, convert to formatted string, etc
- `TimePeriod.Day(_ date: Date, calendar: Calendar)`returns a slightly more robust `struct` with properties of its components (eg `Second`, `Minute`, `Hour`) that each have useful properties (eg `Day.Hour.isAM`, `Day.Month.string`)

## UniqueID.swift
- `UniqueID` is a `typealias` for `String` where `UniqueID()` uses `CryptoKit` to return a SHA256 based on the current time +/- a random 99 milliseconds