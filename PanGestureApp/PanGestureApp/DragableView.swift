//
//  DraggableView.swift
//  PanGestureApp
//
//  Created by Kim TaeSoo on 2021/08/17.
//

import UIKit

class DragableView: UIView {
    
    var dragType = DragType.none
    
    init() {
        super.init(frame: CGRect.zero)
        
        let pan = UIPanGestureRecognizer(target: self, action: #selector(dragging))
        self.addGestureRecognizer(pan)
    }
    
    // required init 인터페이스 빌더로 만들어서 연결했을 경우 여기를 탐
    required init?(coder: NSCoder) {
        /*super.init(coder: coder)
        let pan = UIPanGestureRecognizer(target: self, action: #selector(dragging))
        self.addGestureRecognizer(pan)
        */
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func dragging(pan: UIPanGestureRecognizer) {
        switch pan.state {
        case .began:
            print("began")
        case .changed:
            // 얼만큼 움직였는가 보는 것 죄표의 개념임
            let delta = pan.translation(in: self.superview)
            
            // view의 기준점 설정 (좌표)
            var myPosition = self.center
            
            // 움직이는 방향을 제한하고 싶을 때
            if dragType == .x { // x 축만
                myPosition.x += delta.x
            }
            else if dragType == .y { // y 축만
                myPosition.y += delta.y
            }
            else { //x,y 둘다
                myPosition.x += delta.x
                myPosition.y += delta.y
            }
            
            /* 좌표값을 통해 위치 변경
            myPosition.x += delta.x
            myPosition.y += delta.y
             */
            self.center = myPosition
            pan.setTranslation(CGPoint.zero, in: self.superview)
        case .ended, .cancelled: // 손을 땠을 때
            print("ended || cancelled")
            // 끝까지 갔을 때 돌아오는거 처리
            if self.frame.minX < 0 { // minX는 만든 사각형의 x축의 최솟값
                self.frame.origin.x = 0
            }
            if let hasSuperView = self.superview {
                if self.frame.maxX > hasSuperView.frame.maxX {
                    self.frame.origin.x = hasSuperView.frame.maxX - self.bounds.width
                }
            }
            
        default:
            break
        }
    }
}
