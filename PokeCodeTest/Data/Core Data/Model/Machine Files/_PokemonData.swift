// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to PokemonData.swift instead.

import Foundation
import CoreData

public enum PokemonDataAttributes: String {
    case baseExperience = "baseExperience"
    case catchDate = "catchDate"
    case height = "height"
    case id = "id"
    case name = "name"
    case order = "order"
    case spritePath = "spritePath"
    case weight = "weight"
}

public enum PokemonDataRelationships: String {
    case pokemonTypesData = "pokemonTypesData"
}

open class _PokemonData: NSManagedObject {

    // MARK: - Class methods

    open class func entityName () -> String {
        return "PokemonData"
    }

    open class func entity(managedObjectContext: NSManagedObjectContext) -> NSEntityDescription? {
        return NSEntityDescription.entity(forEntityName: self.entityName(), in: managedObjectContext)
    }

    @nonobjc
    open class func fetchRequest() -> NSFetchRequest<PokemonData> {
        return NSFetchRequest(entityName: self.entityName())
    }

    // MARK: - Life cycle methods

    public override init(entity: NSEntityDescription, insertInto context: NSManagedObjectContext?) {
        super.init(entity: entity, insertInto: context)
    }

    public convenience init?(managedObjectContext: NSManagedObjectContext) {
        guard let entity = _PokemonData.entity(managedObjectContext: managedObjectContext) else { return nil }
        self.init(entity: entity, insertInto: managedObjectContext)
    }

    // MARK: - Properties

    @NSManaged open
    var baseExperience: Int32 // Optional scalars not supported

    @NSManaged open
    var catchDate: Date?

    @NSManaged open
    var height: Int32 // Optional scalars not supported

    @NSManaged open
    var id: Int16 // Optional scalars not supported

    @NSManaged open
    var name: String?

    @NSManaged open
    var order: Int32 // Optional scalars not supported

    @NSManaged open
    var spritePath: String?

    @NSManaged open
    var weight: Int32 // Optional scalars not supported

    // MARK: - Relationships

    @NSManaged open
    var pokemonTypesData: NSSet

    open func pokemonTypesDataSet() -> NSMutableSet {
        return self.pokemonTypesData.mutableCopy() as! NSMutableSet
    }

}

extension _PokemonData {

    open func addPokemonTypesData(_ objects: NSSet) {
        let mutable = self.pokemonTypesData.mutableCopy() as! NSMutableSet
        mutable.union(objects as Set<NSObject>)
        self.pokemonTypesData = mutable.copy() as! NSSet
    }

    open func removePokemonTypesData(_ objects: NSSet) {
        let mutable = self.pokemonTypesData.mutableCopy() as! NSMutableSet
        mutable.minus(objects as Set<NSObject>)
        self.pokemonTypesData = mutable.copy() as! NSSet
    }

    open func addPokemonTypesDataObject(_ value: PokemonTypeData) {
        let mutable = self.pokemonTypesData.mutableCopy() as! NSMutableSet
        mutable.add(value)
        self.pokemonTypesData = mutable.copy() as! NSSet
    }

    open func removePokemonTypesDataObject(_ value: PokemonTypeData) {
        let mutable = self.pokemonTypesData.mutableCopy() as! NSMutableSet
        mutable.remove(value)
        self.pokemonTypesData = mutable.copy() as! NSSet
    }

}

