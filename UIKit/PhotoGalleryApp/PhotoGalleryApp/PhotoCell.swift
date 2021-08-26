//
//  PhotoCell.swift
//  PhotoGalleryApp
//
//  Created by Kim TaeSoo on 2021/08/20.
//

import UIKit
import Photos
class PhotoCell: UICollectionViewCell {
    // 이미지는 asset을 통해서 가져옴
    func loadImage(asset: PHAsset) {
        let imageManager = PHImageManager()
        let scale = UIScreen.main.scale
        let imageSize = CGSize(width: scale * 150, height: scale * 150)
        
        let options = PHImageRequestOptions()
        options.deliveryMode = .highQualityFormat// .fastformat은 저화질 nil을 준 옵션에다가 options를 넣으면 고화질인 상태로만 쭉 있음
        self.photoImageView.image = nil // 새로고침을 했을 때 순서가 바뀌는부분에 대한 처리
        imageManager.requestImage(for: asset, targetSize: imageSize, contentMode: .aspectFill, options: nil) { image, info in
            if (info?[PHImageResultIsDegradedKey] as? Bool) == true{
                //저화질
                //self.photoImageView.image = image
            }
            else{
                //고화질
                //self.photoImageView.image = image
            }
            self.photoImageView.image = image
        }
    }
    
    
    //라이브러리에서 가져온 이미지를 뿌려줌
    @IBOutlet weak var photoImageView: UIImageView!{
        didSet{
            // 이미지를 불러왔을 때 꽉차게 하는법
            photoImageView.contentMode = .scaleAspectFill
        }
    }
}
