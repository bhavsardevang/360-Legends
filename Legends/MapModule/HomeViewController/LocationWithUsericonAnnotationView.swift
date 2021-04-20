//
//  LocationWithUsericon.swift
//  Legends
//
//   on 15/04/21.
//

import Foundation
import MapKit

final class LocationWithUsericonAnnotationView: MKAnnotationView {

    // MARK: Initialization

    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)

        frame = CGRect(x: 0, y: 0, width: 106, height: 74)
        centerOffset = CGPoint(x: 0, y: -frame.size.height / 2)

        canShowCallout = true
        setupUI()
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Setup

    private func setupUI() {
       // backgroundColor = .clear

        let view = AnnotationCustomView()
        addSubview(view)

        view.frame = bounds
    }
}
