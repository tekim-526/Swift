//
//  ViewController.swift
//  PhotoGalleryApp
//
//  Created by Kim TaeSoo on 2021/08/20.
//

import UIKit
import PhotosUI // 사진앱 기반해서 앨범을 띄우기 위한 프레임 워크

class ViewController: UIViewController {

    // var images = [UIImage?]() // 이미지를 저장할 공간 밑부분 주석에써져 있는 코드에서 사용
    var fetchResults: PHFetchResult<PHAsset>?
    
    @IBOutlet weak var photoCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Photo Gallery App"
        makeNavigationItem()
        
        // cell 사이즈 설정
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: (UIScreen.main.bounds.width - 1) / 2, height: 200)
        
        // cell 사이사이의 간격
        layout.minimumInteritemSpacing = 1 // 가로 cell의 공간
        layout.minimumLineSpacing = 1
        photoCollectionView.collectionViewLayout = layout
        photoCollectionView.dataSource = self
    }
    
    
    func makeNavigationItem () {
        // 오른쪽 버튼
        let photoItem = UIBarButtonItem(image: UIImage(systemName: "photo.on.rectangle"), style: .done, target: self, action: #selector(checkPermission))
        photoItem.tintColor = .black.withAlphaComponent(0.7)
        self.navigationItem.rightBarButtonItem = photoItem
        
        // 왼쪽 버튼
        let refreshItem = UIBarButtonItem(image: UIImage(systemName: "arrow.clockwise"), style: .done, target: self, action: #selector(refresh))
        refreshItem.tintColor = .black.withAlphaComponent(0.7)
        self.navigationItem.leftBarButtonItem = refreshItem
    }
    
    @objc func checkPermission() {
        //permission이 되어 있는지 확인 -> authorizationStatus()
        if PHPhotoLibrary.authorizationStatus() == .authorized || PHPhotoLibrary.authorizationStatus() == .limited {
            DispatchQueue.main.async {
                self.showGallery()
            }
            
        }
        else if PHPhotoLibrary.authorizationStatus() == .denied {
            DispatchQueue.main.async {
                self.showAutorizationDeniedAlert()
            }
        }
        else if PHPhotoLibrary.authorizationStatus() == .notDetermined { // 제일 중요한 상황 Info.plist로 가서 경고문구 주어야함 (심사를 위해)
             // requestAuthorization가 작동할 때 설정한 문구가 나옴
            PHPhotoLibrary.requestAuthorization { status in
                // 재귀를 통해 함수를 다시 호출하여 사용
                
                self.checkPermission()
            }
        }
    }
    
    func showAutorizationDeniedAlert() {
        let alert = UIAlertController(title: "포토라이브러리 접근 권환을 활성화 할 수 없습니다", message: nil, preferredStyle: .alert)
        // UI에 버튼을 붙히는 과정
        alert.addAction(UIAlertAction(title: "닫기", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "설정", style: .default, handler: { action in
            // 내부나 외부의 링크나 설정으로 갈 수 있음, 여기서는 setting으로 가는 url을 줌 -> openSettingsURLString
            guard let url = URL(string: UIApplication.openSettingsURLString) else {
                return
            }
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc func showGallery() {
        let library = PHPhotoLibrary.shared()
        var configuration = PHPickerConfiguration(photoLibrary: library)
        configuration.selectionLimit = 10
        let picker = PHPickerViewController(configuration: configuration)
        picker.delegate = self
        present(picker, animated: true)
    }
    
    @objc func refresh() {
        // 가져온 이미지를 저화질에서 고화질로 바꾸어줌
        self.photoCollectionView.reloadData()
    }

}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.fetchResults?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as! PhotoCell
        
        if let asset = self.fetchResults?[indexPath.row] {
            cell.loadImage(asset: asset)
        }
        return cell
    }
}

extension ViewController: PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        // 바로 갤러리에서 불러오는 것은 그렇게 좋은 방법이 아님, 사이즈가 너무 크기 때문
        // 불러온 정보를 이미지로 바꾸는 법 -> self.fetchresults를 통해서 전체를 받아옴
        // 화면에 꽉 채우기 위해서는 scale을 곱해주어야함, 150은 우리가 임의로 설정한 크기를 해주면 좋음 -> let imageSize = ~~~
        // 선택한 사진의 정보를 가져오는 방법
        //let identifiers = results.map( \.assetIdentifier )
        let identifiers = results.map{ $0.assetIdentifier ?? "" }
        self.fetchResults = PHAsset.fetchAssets(withLocalIdentifiers: identifiers, options: nil)
        self.photoCollectionView.reloadData()
        
        // 작업을 완료하고, cancel을 눌렀을때 내려가는 부분
        self.dismiss(animated: true, completion: nil)
        /*
        fetchAssets.enumerateObjects { asset, index, stop in
            if index == 2 { // 두번째에 멈추게 함 인덱스를 받아서
                stop.pointee = true
            }
            let imageManager = PHImageManager()
            let scale = UIScreen.main.scale
            let imageSize = CGSize(width: scale * 150, height: scale * 150)
            
            imageManager.requestImage(for: asset, targetSize: imageSize, contentMode: .aspectFill, options: nil) { image, info in
                self.images.append(image)
            }*/
            
            
        }
        
    }
    
    

