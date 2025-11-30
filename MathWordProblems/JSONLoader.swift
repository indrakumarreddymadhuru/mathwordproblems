import Foundation

struct JSONLoader {
    static func loadProblems(for difficulty: Difficulty) -> [Problem] {
        let fileName = difficulty.jsonFileName

        guard let url = Bundle.main.url(forResource: fileName, withExtension: "json") else {
            print("❌ Could not find \(fileName).json in bundle")
            return []
        }

        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let rawProblems = try decoder.decode([Problem].self, from: data)
            return rawProblems
        } catch {
            print("❌ Failed to decode \(fileName).json: \(error)")
            return []
        }
    }
}

