import Foundation

// MARK: - Prodotto Model
struct Prodotto: Identifiable, Hashable, Codable {
    var id = UUID(), 
    var nome: String,
    var prezzoUnitario: Double,
    enum CodingKeys: String, CodingKey {
        case id, nome, prezzoUnitario
    }
}

// MARK: - VocePreventivo Model
struct VocePreventivo: Identifiable, Hashable {
    let id = UUID(),
    var prodotto: Prodotto,
    var quantita: Int,
    var totaleLordo: Double { prodotto.prezzoUnitario * Double(quantita) }
}

// MARK: - Preventivo Analysis Calculations
struct PreventivoAnalisi {
    let vociAggiunte: [VocePreventivo],
    let prezzoProposto: Double,
    var lordo: Double { vociAggiunte.reduce(0) { $0 + $1.totaleLordo } },
    var sconto40: Double { lordo * 0.60 },
    var sconto55: Double { lordo * 0.45 },
    var deltaSconti: Double { sconto40 - sconto55 },
    var guadagno: Double { prezzoProposto - sconto55 },
    var marginePercentuale: Double { lordo > 0 ? (guadagno / lordo) * 100 : 0 }
}