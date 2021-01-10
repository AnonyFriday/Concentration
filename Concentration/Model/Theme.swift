import UIKit

enum Theme : String, CaseIterable {
    case halloween = "🎃👻💀👺👹👽🤖🎃😡🧟‍♂️"
    case animals    = "🐶🐱🐭🐹🐰🦊🐻🐼🐻‍❄️🐨"
    case sports     = "🏹🎣🥋🛹🪃🛷🏋️‍♀️🤸🏊‍♂️🧗"
    case fruits     = "🍏🍐🍊🍋🍌🍉🍇🍓🫐🍈"
    case food       = "🥪🥙🧆🌭🍕🍟🫔🍲🍙🍘"
    case devices    = "🗜📸📟🧭📡🧯🛢🔋⏲📻"
    case flags      = "🏳️‍🌈🏳️‍⚧️🇦🇩🇦🇼🇦🇲🇦🇸🇧🇩🇧🇧🇧🇴🇧🇹"
    case pictographs = "🀙🀚🀛🀜🀝🀞🀟🀠🀡🀢🀣🀤🀥🀦🀧🀨"
    case transports = "🚗🚕🚙🚌🚎🏎🚓🚜🚛🚚🛻🚐🚒"
    
    static func pickRandomTheme() -> String {
        let randomCase = Int(arc4random_uniform(UInt32(Theme.allCases.count - 1)))
        return Theme.allCases[randomCase].rawValue
    }
    
}
