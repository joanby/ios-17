import UIKit

let json = """
{
"loans":
[{
    "name" : "Juan Gabriel",
    "location" : {
        "country" : "Spain",
        "locale" : "ES"
    },
    "use" : "To build a beautiful school for poor children",
    "loan_amount" : 250
},
{
    "name" : "María Santos",
    "location" : {
        "country" : "Spain",
        "locale" : "ES"
    },
    "use" : "To show people how to code in Python",
    "loan_amount" : 150
}]
}
"""

struct LoanFactory : Codable {
    var loans: [Loan]
}

struct Loan: Codable {
    var name: String
    var country: String
    var use: String
    var amount: Int
    var locale: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case country = "location"
        case use
        case amount = "loan_amount"
    }
    
    enum LocationKeys: String, CodingKey {
        case country
        case locale
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        let locationContainer = try container.nestedContainer(keyedBy: LocationKeys.self, forKey: .country)
        self.country = try locationContainer.decode(String.self, forKey: .country)
        self.locale = try locationContainer.decode(String.self, forKey: .locale)
        self.use = try container.decode(String.self, forKey: .use)
        self.amount = try container.decode(Int.self, forKey: .amount)
    }
    
}

let decoder = JSONDecoder()

if let jsonData = json.data(using: .utf8) {
    do {
        let loanFactory = try decoder.decode(LoanFactory.self, from: jsonData)
        for loan in loanFactory.loans {
            print(loan)
        }
    } catch {
        print(error)
    }
}


