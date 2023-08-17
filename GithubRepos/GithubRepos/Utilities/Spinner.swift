//
//  Spinner.swift
//  GithubRepos
//
//  Created by sobharaj mohapatra on 17/08/23.
//
import SwiftUI
import UIKit

struct Spinner: UIViewRepresentable {
    
    let style: UIActivityIndicatorView.Style

    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let spinner = UIActivityIndicatorView(style: style)
        spinner.hidesWhenStopped = true
        spinner.startAnimating()
        return spinner
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {}
}
