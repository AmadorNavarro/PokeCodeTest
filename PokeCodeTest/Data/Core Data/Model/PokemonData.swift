import Foundation
import CoreData

@objc(PokemonData)
open class PokemonData: _PokemonData {
	
    convenience init(entity: PokemonEntity, context: NSManagedObjectContext) {
        self.init(context: context)
        id = Int16(entity.id ?? 0)
        name = entity.name
        spritePath = entity.spritePath
        baseExperience = Int32(entity.baseExperience ?? 0)
        weight = Int32(entity.weight ?? 0)
        height = Int32(entity.height ?? 0)
        
        guard let types = entity.types else { return }
        for type in types {
            addPokemonTypesDataObject(PokemonTypeData(entity: type, context: context))
        }
    }
    
}
