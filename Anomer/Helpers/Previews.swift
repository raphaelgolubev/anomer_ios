//
//  Previews.swift
//  Anomer
//
//  Created by Рафаэль Голубев on 08.08.2025.
//

// MARK: - UIView

#if canImport(SwiftUI) && DEBUG
import SwiftUI

/// Позволяет просматривать `UIView` в SwiftUI_Previews
/// - Чтобы включить/выключить окно предпросмотра: `Xcode -> Editor -> Canvas`
///
/// Использование:
/// ```
/// final class MyView: UIView {
///     //...
/// }
///
/// // Поместите этот код в top-level файла
/// struct MyView_Previews: PreviewProvider {
///     static var previews: some View {
///         UIViewPreview {
///             MyView()
///         }
///     }
/// }
/// ```
struct UIViewPreview<View: UIView>: UIViewRepresentable {
    let view: View
    
    init(_ builder: @escaping () -> View) {
        view = builder()
    }
    
    // MARK: UIViewRepresentable
    func makeUIView(context: Context) -> UIView {
        return view
    }
    
    func updateUIView(_ view: UIView, context: Context) {
        view.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        view.setContentHuggingPriority(.defaultHigh, for: .vertical)
    }
}

#endif

// MARK: - UIViewController

#if canImport(SwiftUI) && DEBUG
import SwiftUI

/// Позволяет просматривать `UIViewController` в SwiftUI_Previews
/// - Чтобы включить/выключить окно предпросмотра: `Xcode -> Editor -> Canvas`
///
/// Использование:
/// ```
/// final class MyViewController: UIViewController {
///     //...
/// }
///
/// // Поместите этот код в top-level файла
/// struct MyViewController_Previews: PreviewProvider {
///     static var previews: some View {
///         UIViewControllerPreview {
///             MyViewController()
///         }
///     }
/// }
/// ```
struct UIViewControllerPreview<ViewController: UIViewController>: UIViewControllerRepresentable {

    let viewController: ViewController

    init(_ builder: @escaping () -> ViewController) {
        viewController = builder()
    }

    // MARK: - UIViewControllerRepresentable
    func makeUIViewController(context: Context) -> ViewController {
        viewController
    }
    
    func updateUIViewController(_ uiViewController: ViewController, context: Context) {}
}
#endif
