import Foundation
import Combine

class PreventivoViewModel: ObservableObject {
    @Published var vociAggiunte: [Voce] = []
    @Published var prezzoProposto: String = ""
    @Published var searchText: String = ""
    @Published var prodottoSelezionato: Prodotto? = nil
    @Published var quantita: String = ""

    func aggiungiVoce(_ voce: Voce) {
        vociAggiunte.append(voce)
    }

    func rimuoviVoce(_ voce: Voce) {
        if let index = vociAggiunte.firstIndex(where: { $0.id == voce.id }) {
            vociAggiunte.remove(at: index)
        }
    }

    func resetForm() {
        prezzoProposto = ""
        searchText = ""
        prodottoSelezionato = nil
        quantita = ""
        vociAggiunte.removeAll()
    }

    func reset() {
        // Reset logic specific to your use case
    }

    func filtraProdotti() -> [Prodotto] {
        // Implement filtering logic based on searchText
        return []
    }

    var analisi: PreventivoAnalisi {
        // Return appropriate PreventivoAnalisi based on current state
        return PreventivoAnalisi() // Example instantiation
    }
}