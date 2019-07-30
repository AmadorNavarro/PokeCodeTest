import Foundation
import CoreData

@objc(PokemonTypeData)
open class PokemonTypeData: _PokemonTypeData {
	
    convenience init(entity: PokemonType, context: NSManagedObjectContext) {
        self.init(context: context)
        name = entity.name
    }
    
}
