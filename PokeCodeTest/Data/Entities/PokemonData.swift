import Foundation
import CoreData

@objc(PokemonData)
open class PokemonData: _PokemonData {
    
    convenience init(entity: Pokemon, context: NSManagedObjectContext) {
        self.init(context: context)
        id = Int16(entity.id)
        name = entity.name
        spritePath = entity.spritePath
        baseExperience = Int32(entity.baseExperience)
        weight = Int32(entity.weight)
        height = Int32(entity.height)
        catchDate = entity.catchDate
        order = Int32(entity.order)
        
        for type in entity.types {
            addPokemonTypesDataObject(PokemonTypeData(entity: type, context: context))
        }
    }
    
    func types() -> [PokemonTypeData] {
        return pokemonTypesData.allObjects as? [PokemonTypeData] ?? []
    }
    
}
