import LocalAuthentication

public class RequestBiometry {
    
    var evaluetePolicy: LAContext

    public init(evaluetePolicy: LAContext) {
        self.evaluetePolicy = evaluetePolicy
    }

    public func request(completion: @escaping (Bool) -> Void) {
        var authError: NSError?

        if evaluetePolicy.canEvaluatePolicy(.deviceOwnerAuthentication, error: &authError) {
            let reason = "Identify yourself!"
            evaluetePolicy.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { result, authenticationError in
                completion(result)
                return
            }
        }
        completion(false)
        return
    }

}
