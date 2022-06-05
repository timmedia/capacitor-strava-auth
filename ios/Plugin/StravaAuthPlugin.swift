import Foundation
import Capacitor
import AuthenticationServices

/**
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitorjs.com/docs/plugins/ios
 */
@objc(StravaAuthPlugin)
public class StravaAuthPlugin: CAPPlugin {
    private let implementation = StravaAuth()
    private var authSession: ASWebAuthenticationSession?
    
    @objc func authorize(_ call: CAPPluginCall) {
        let clientId = call.getString("clientId")?.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? ""
        let redirectUri = call.getString("redirectUri")?.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? ""
        let responseType = call.getString("responseType")?.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? ""
        let approvalPrompt = call.getString("approvalPrompt")?.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? ""
        let scope = call.getString("scope")?.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? ""
        let state = call.getString("state")?.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? ""
        
        
        let appOAuthUrlStravaScheme = URL(string: "strava://oauth/mobile/authorize?client_id=\(clientId)&redirect_uri=\(redirectUri)&response_type=\(responseType)&approval_prompt=\(approvalPrompt)&scope=\(scope)&state=\(state)")!

        let webOAuthUrl = URL(string: "https://www.strava.com/oauth/mobile/authorize?client_id=\(clientId)&redirect_uri=\(redirectUri)&response_type=\(responseType)&approval_prompt=\(approvalPrompt)&scope=\(scope)&state=\(state)")!
        
        if UIApplication.shared.canOpenURL(appOAuthUrlStravaScheme) {
            UIApplication.shared.open(appOAuthUrlStravaScheme, options: [:])
        } else {
            authSession = ASWebAuthenticationSession(url: webOAuthUrl, callbackURLScheme: "https://") {
                url, error in
            }
        }
        call.resolve()
    }
}
