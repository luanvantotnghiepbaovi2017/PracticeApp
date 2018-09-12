#if os(OSX)
import AppKit.NSFont
internal typealias Font = NSFont
#elseif os(iOS) || os(tvOS) || os(watchOS)
import UIKit.UIFont
internal typealias Font = UIFont
#endif

internal struct FontConvertible {
    internal let name: String
    internal let family: String
    internal let path: String
    
    internal func font(size: CGFloat) -> Font! {
        return Font(font: self, size: size)
    }
    
    internal func register() {
        guard let url = url else { return }
        var errorRef: Unmanaged<CFError>?
        CTFontManagerRegisterFontsForURL(url as CFURL, .process, &errorRef)
    }
    
    fileprivate var url: URL? {
        let bundle = Bundle(for: BundleToken.self)
        return bundle.url(forResource: path, withExtension: nil)
    }
}

internal extension Font {
    convenience init!(font: FontConvertible, size: CGFloat) {
        #if os(iOS) || os(tvOS) || os(watchOS)
        if !UIFont.fontNames(forFamilyName: font.family).contains(font.name) {
            font.register()
        }
        #elseif os(OSX)
        if let url = font.url, CTFontManagerGetScopeForURL(url as CFURL) == .none {
            font.register()
        }
        #endif
        
        self.init(name: font.name, size: size)
    }
}

internal enum FontFamily {
    internal enum ProximaNova {
        internal static let bold = FontConvertible(name: "ProximaNova-Bold", family: "Proxima Nova", path: "proximanova-bold-webfont.ttf")
        internal static let light = FontConvertible(name: "ProximaNova-Light", family: "Proxima Nova", path: "proximanova-light-webfont.ttf")
        internal static let regular = FontConvertible(name: "ProximaNova-Regular", family: "Proxima Nova", path: "proximanova-regular-webfont.ttf")
        internal static let regularItalic = FontConvertible(name: "ProximaNova-RegularIt", family: "Proxima Nova", path: "proximanova-regularitalic-webfont.ttf")
        internal static let semibold = FontConvertible(name: "ProximaNova-Semibold", family: "Proxima Nova", path: "proximanova-semibold-webfont.ttf")
    }
    internal enum ProximaNovaThin {
        internal static let thin = FontConvertible(name: "ProximaNovaT-Thin", family: "Proxima Nova Thin", path: "proximanovat-thin-webfont.ttf")
    }
}

private final class BundleToken {}
