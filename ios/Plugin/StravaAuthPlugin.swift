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
    
    @IBAction func authorize(_ call: CAPPluginCall) {
        let clientId = call.getString("clientId") ?? ""
        let redirectUri = call.getString("redirectUri") ?? ""
        let responseType = call.getString("responseType") ?? ""
        let approvalPrompt = call.getString("approvalPrompt") ?? ""
        let scope = call.getString("scope") ?? ""
        let state = call.getString("state") ?? ""
        
        let appOAuthUrlStravaScheme = URL(string: "strava://oauth/mobile/authorize?client_id=\(clientId)&redirect_uri=YourApp%3A%2F%2Fwww.yourapp.com%2Fen-US&response_type=\(responseType)&approval_prompt=\(approvalPrompt)&scope=\(scope)&state=\(state)")!

        let webOAuthUrl = URL(string: "https://www.strava.com/oauth/mobile/authorize?client_id=\(clientId)&redirect_uri= YourApp%3A%2F%2Fwww.yourapp.com%2Fen-US&response_type=\(responseType)&approval_prompt=\(approvalPrompt)&scope=\(scope)&state=\(state)")!
        
        if UIApplication.shared.canOpenURL(appOAuthUrlStravaScheme) {
            UIApplication.shared.open(appOAuthUrlStravaScheme, options: [:])
        } else {
            authSession = ASWebAuthenticationSession(url: webOAuthUrl, callbackURLScheme: "YourApp://") {
                url, error in
            }
        }
        call.resolve()
    }
}
