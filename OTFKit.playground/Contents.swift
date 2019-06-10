import Cocoa
import OTFKit

var str = "Hello, playground"

let fontNames = ["Lato", "Clan"]

let otfcotroller = FFFeaturesController(fontNames: fontNames, size: 12)

otfcotroller.types.forEach({print ($0)})
otfcotroller.selectorInFonts.forEach({key, fonts in
    print (key)
    fonts.forEach { print("\t\($0)") }
})
