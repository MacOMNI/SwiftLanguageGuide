//
//  NumberStepper.swift
//  SwiftGuide
//
//  Created by Mackun on 2020/10/22.
//  Copyright © 2020 Xcode. All rights reserved.
//

import UIKit

@IBDesignable
class NumberStepper: UIControl {
    @IBInspectable public var stepValue: Int = 1
    @IBInspectable public var minimumValue: Int = 0
    @IBInspectable public var maximumValue: Int = 100
    @IBInspectable public var showIntegerIfDoubleIsInteger: Bool = true

    @IBInspectable
    public var value: Int = 0 {
        didSet {
            label.text = String(value)
            if oldValue != value {
                sendActions(for: .valueChanged)
            }
        }
    }

    @IBInspectable
    public var buttonsTextColor: UIColor = .black {
        didSet {
            for button in [leftButton, rightButton] {
                button.setTitleColor(buttonsTextColor, for: .normal)
            }
        }
    }

    @IBInspectable
    public var buttonsBackgroundColor: UIColor = .darkGray {
        didSet {
            for button in [leftButton, rightButton] {
                button.backgroundColor = buttonsBackgroundColor
               // button.setBackgroundImage(<#T##image: UIImage?##UIImage?#>, for: <#T##UIControl.State#>)
                button.setBackgroundColor(buttonsBackgroundColor, forState: .normal)
            }
            backgroundColor = buttonsBackgroundColor
        }
    }

    public var buttonsFont = UIFont.systemFont(ofSize: 21, weight: .bold) {
        didSet {
            for button in [leftButton, rightButton] {
                button.titleLabel?.font = buttonsFont
            }
        }
    }

    @IBInspectable
    public var labelTextColor: UIColor = .white {
        didSet {
            label.textColor = labelTextColor
        }
    }

    @IBInspectable
    public var labelBackgroundColor: UIColor = .clear {
        didSet {
            label.backgroundColor = labelBackgroundColor
        }
    }

    public var labelFont = UIFont.systemFont(ofSize: 14, weight: .regular) {
        didSet {
            label.font = labelFont
        }
    }

    public lazy var rightButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("-", for: .normal)
        button.setTitleColor(buttonsTextColor, for: .normal)
       // button.backgroundColor = buttonsBackgroundColor
        button.setBackgroundColor(buttonsBackgroundColor, forState: .normal)
        button.titleLabel?.font = buttonsFont
        button.addTarget(self, action: #selector(rightButtonTouchDown), for: .touchDown)
        button.addTarget(self, action: #selector(buttonTouchUp), for: .touchUpInside)
        button.addTarget(self, action: #selector(buttonTouchUp), for: .touchUpOutside)
        button.addTarget(self, action: #selector(buttonTouchUp), for: .touchCancel)
        return button
    }()

    public lazy var leftButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("+", for: .normal)
        button.setTitleColor(buttonsTextColor, for: .normal)
        button.backgroundColor = buttonsBackgroundColor
        button.setBackgroundColor(buttonsBackgroundColor, forState: .normal)
        button.titleLabel?.font = buttonsFont
        button.addTarget(self, action: #selector(leftButtonTouchDown), for: .touchDown)
        button.addTarget(self, action: #selector(buttonTouchUp), for: .touchUpInside)
        button.addTarget(self, action: #selector(buttonTouchUp), for: .touchUpOutside)
        button.addTarget(self, action: #selector(buttonTouchUp), for: .touchCancel)
        return button
    }()

    public lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = String(value)
        label.textColor = labelTextColor
        label.backgroundColor = labelBackgroundColor
        label.font = labelFont
        return label
    }()

    enum StepperState {
        case Stable, ShouldIncrease, ShouldDecrease
    }

    private var stepperState = StepperState.Stable {
        didSet {
            if stepperState != .Stable {
                updateValue()
            }
        }
    }

    required
    public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
        layout()
    }

    override
    public init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        layout()
    }

    func setup() {
        addSubview(leftButton)
        addSubview(rightButton)
        addSubview(label)

        backgroundColor = buttonsBackgroundColor
        layer.borderWidth = 1
        layer.borderColor = UIColor.red.cgColor
        layer.cornerRadius = 5
        clipsToBounds = true
    }

    func layout() {
        let xMargin = CGFloat(3)
        NSLayoutConstraint.activate([
            leftButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 7),
            leftButton.trailingAnchor.constraint(equalTo: label.leadingAnchor, constant: -xMargin),
            leftButton.widthAnchor.constraint(equalToConstant: 44),
            leftButton.topAnchor.constraint(equalTo: topAnchor),
            leftButton.bottomAnchor.constraint(equalTo: bottomAnchor),

            label.trailingAnchor.constraint(equalTo: rightButton.leadingAnchor, constant: -xMargin),
            //Just so the label doesn't change width when we change the value
            label.widthAnchor.constraint(greaterThanOrEqualToConstant: 50),
            label.topAnchor.constraint(equalTo: topAnchor),
            label.bottomAnchor.constraint(equalTo: bottomAnchor),

            rightButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -7),
            rightButton.widthAnchor.constraint(equalToConstant: 44),
            rightButton.topAnchor.constraint(equalTo: topAnchor),
            rightButton.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }

    func updateValue() {
        if stepperState == .ShouldIncrease {
            value += stepValue
        } else if stepperState == .ShouldDecrease {
            value -= stepValue
        }
    }
}

extension NumberStepper {
    @objc
    func reset() {
        stepperState = .Stable
        leftButton.isEnabled = true
        rightButton.isEnabled = true
    }
}
extension UIButton {
    func setBackgroundColor(_ color: UIColor, forState: UIControl.State) {
        UIGraphicsBeginImageContext(CGSize(width: 1, height: 1))
        UIGraphicsGetCurrentContext()!.setFillColor(color.cgColor)
        UIGraphicsGetCurrentContext()!.fill(CGRect(x: 0, y: 0, width: 1, height: 1))
        let colorImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        setBackgroundImage(colorImage, for: forState)
    }
}

extension NumberStepper {
    @objc
    func leftButtonTouchDown(button: UIButton) {
        leftButton.isEnabled = false
        if value != maximumValue {
            stepperState = .ShouldIncrease
        }
    }

    @objc
    func rightButtonTouchDown(button: UIButton) {
        rightButton.isEnabled = false
        if value != minimumValue {
            stepperState = .ShouldDecrease
        }
    }

    @objc
    func buttonTouchUp(button: UIButton) {
        reset()
    }
}
