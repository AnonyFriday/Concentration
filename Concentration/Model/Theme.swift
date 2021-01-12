import UIKit

enum Theme : String, CaseIterable
{
    case halloween      = "🎃👻💀👺👹👽🤖🎃😡🧟‍♂️"
    case animals        = "🐶🐱🐭🐹🐰🦊🐻🐼🐻‍❄️🐨"
    case sports         = "🏹🎣🥋🛹🪃🛷🏋️‍♀️🤸🏊‍♂️🧗"
    case fruits         = "🍏🍐🍊🍋🍌🍉🍇🍓🫐🍈"
    case food           = "🥪🥙🧆🌭🍕🍟🫔🍲🍙🍘"
    case devices        = "🗜📸📟🧭📡🧯🛢🔋⏲📻"
    case flags          = "🏳️‍🌈🏳️‍⚧️🇦🇩🇦🇼🇦🇲🇦🇸🇧🇩🇧🇧🇧🇴🇧🇹"
    case pictographs    = "🀙🀚🀛🀜🀝🀞🀟🀠🀡🀢🀣🀤🀥🀦🀧🀨"
    case transports     = "🚗🚕🚙🚌🚎🏎🚓🚜🚛🚚🛻🚐🚒"
    
    
    static func pickRandomTheme() -> String
    {
        let randomCase = Theme.allCases.count.arc4Random()
        return Theme.allCases[randomCase].rawValue
    }
    
}
