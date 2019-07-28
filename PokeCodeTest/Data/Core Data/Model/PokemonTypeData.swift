import Foundation
import CoreData

@objc(PokemonTypeData)
open class PokemonTypeData: _PokemonTypeData {
	
    convenience init(entity: PokemonTypeEntity, context: NSManagedObjectContext) {
        self.init(context: context)
        name = entity.name
    }
    
}
