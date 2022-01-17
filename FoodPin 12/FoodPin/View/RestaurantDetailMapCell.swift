//
//  RestaurantDetailMapCell.swift
//  RestaurantDetailMapCell
//
//  Created by Simon Ng on 18/8/2021.
//

import UIKit
import MapKit

class RestaurantDetailMapCell: UITableViewCell {

    @IBOutlet var mapView: MKMapView! {
        didSet {
            mapView.layer.cornerRadius = 20.0
            mapView.clipsToBounds = true
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
