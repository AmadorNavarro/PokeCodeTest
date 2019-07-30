// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to PokemonTypeData.swift instead.

import Foundation
import CoreData

public enum PokemonTypeDataAttributes: String {
    case name = "name"
}

public enum PokemonTypeDataRelationships: String {
    case pokemonData = "pokemonData"
}

open class _PokemonTypeData: NSManagedObject {

    // MARK: - Class methods

    open class func entityName () -> String {
        return "PokemonTypeData"
    }

    open class func entity(managedObjectContext: NSManagedObjectContext) -> NSEntityDescription? {
        return NSEntityDescription.entity(forEntityName: self.entityName(), in: managedObjectContext)
    }

    @nonobjc
    open class func fetchRequest() -> NSFetchRequest<PokemonTypeData> {
        return NSFetchRequest(entityName: self.entityName())
    }

    // MARK: - Life cycle methods

    public override init(entity: NSEntityDescription, insertInto context: NSManagedObjectContext?) {
        super.init(entity: entity, insertInto: context)
    }

    public convenience init?(managedObjectContext: NSManagedObjectContext) {
        guard let entity = _PokemonTypeData.entity(managedObjectContext: managedObjectContext) else { return nil }
        self.init(entity: entity, insertInto: managedObjectContext)
    }

    // MARK: - Properties

    @NSManaged open
    var name: String?

    // MARK: - Relationships

    @NSManaged open
    var pokemonData: PokemonData?

}

