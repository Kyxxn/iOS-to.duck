//
//  Moya.swift
//  toduck
//
//  Created by 박효준 on 5/24/24.
//

import Foundation
import Moya

public enum AuthTarget {
    case requestPhoneVerification(phoneNumber: String) // 휴대폰 본인 인증 요청
    case checkPhoneVerification(code: String) // 휴대폰 본인 인증 확인
    case checkUsernameDuplication(username: String) // 아이디 중복 확인
    case registerUser(userDetails: [String: Any]) // 회원가입
    case login(username: String, password: String) // 자체 로그인
    case loginApple(token: String) // 애플 로그인
    case loginKakao(token: String) // 카카오 로그인
    case loginNaver(token: String) // 네이버 로그인
    case loginGoogle(token: String) // 구글 로그인
    case findIdPassword(phoneNumber: String) // 비밀번호 찾기
    case refreshToken(refreshToken: String) // 리프래시 토큰 발급
    case saveFCMToken(userId: Int, fcmToken:String) // FCM 토큰 저장
    case deleteUser(userId: Int) // 유저 삭제
}

extension AuthTarget: TargetType {
    public var baseURL: URL {
        return URL(string: APIConstants.baseURL)!
    }

    public var path: String {
        switch self {
        case .requestPhoneVerification:
            return "/auth/request-phone-verification"
        case .checkPhoneVerification:
            return "/auth/check-phone-verification"
        case .checkUsernameDuplication:
            return "/auth/check-username-duplication"
        case .registerUser:
            return "/auth/registerUser"
        case .login:
            return "/auth/login"
        case .loginApple:
            return "/auth/oauth/apple"
        case .loginKakao:
            return "/auth/oauth/kakao"
        case .loginNaver:
            return "/auth/oauth/naver"
        case .loginGoogle:
            return "/auth/oauth/google"
        case .findIdPassword:
            return "/auth/find-id-password"
        case .refreshToken:
            return "/auth/refresh-token"
        case .saveFCMToken(let userId, _):
            return "/users/\(userId)/fcm-token"
        case .deleteUser(let userId):
            return "/users/\(userId)"
        }
    }

    public var method: Moya.Method {
        switch self {
        case .refreshToken:
            return .get
        case .requestPhoneVerification,
             .checkPhoneVerification,
             .checkUsernameDuplication,
             .registerUser,
             .login,
             .loginApple,
             .loginKakao,
             .loginNaver,
             .loginGoogle,
             .findIdPassword,
             .saveFCMToken:
            return .post
        case .deleteUser:
            return .delete
        }
    }

    public var task: Moya.Task {
        switch self {
        case .requestPhoneVerification(let phoneNumber):
            return .requestParameters(parameters: ["phoneNumber": phoneNumber], encoding: URLEncoding.default)
        case .checkPhoneVerification(let code):
            return .requestParameters(parameters: ["code": code], encoding: URLEncoding.default)
        case .checkUsernameDuplication(let username):
            return .requestParameters(parameters: ["username": username], encoding: URLEncoding.default)
        case .registerUser(let userDetails):
            return .requestParameters(parameters: userDetails, encoding: JSONEncoding.default)
        case .login(let username, let password):
            return .requestParameters(parameters: ["username": username, "password": password], encoding: JSONEncoding.default)
        case .loginApple(let token), .loginKakao(let token), .loginNaver(let token), .loginGoogle(let token):
            return .requestParameters(parameters: ["token": token], encoding: JSONEncoding.default)
        case .findIdPassword(let phoneNumber):
            return .requestParameters(parameters: ["phoneNumber": phoneNumber], encoding: URLEncoding.default)
        case .refreshToken(let refreshToken):
            return .requestParameters(parameters: ["refreshToken": refreshToken], encoding: URLEncoding.default)
        case .saveFCMToken(_, let fcmToken):
            return .requestParameters(parameters: ["fcmToken": fcmToken], encoding: JSONEncoding.default)
        case .deleteUser:
            return .requestPlain
        }
    }

    public var headers: [String : String]? {
        var headers: [String: String] = ["Content-Type": "application/json"]
        switch self {
        case .requestPhoneVerification,
             .checkPhoneVerification,
             .checkUsernameDuplication,
             .registerUser,
             .login,
             .loginApple,
             .loginKakao,
             .loginNaver,
             .loginGoogle,
             .findIdPassword:
            break
        case .refreshToken,
             .saveFCMToken,
             .deleteUser:
// MARK: 나중에 토큰 관리 회의 후 결정
//            if let accessToken = TokenManager.shared.accessToken {
//                headers["Authorization"] = "Bearer \(accessToken)"
//            }
            break
        }
        return headers
    }
}
