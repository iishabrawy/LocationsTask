//
//  InfoModel.swift
//  Task App
//
//  Created by Ismael AlShabrawy on 01/12/2020.
//

import Foundation

// MARK: - InfoModel
class InfoModel: Codable {
    let message: String?
    let status: Bool?
    let innerData: InnerData?

    enum CodingKeys: String, CodingKey {
        case message = "Message"
        case status = "Status"
        case innerData = "InnerData"
    }

    init(message: String, status: Bool, innerData: InnerData) {
        self.message = message
        self.status = status
        self.innerData = innerData
    }
    
    init() {
        self.message = nil
        self.status = nil
        self.innerData = nil
    }
}

// MARK: - InnerData
class InnerData: Codable {
    let token: String?
    let user: User?

    init(token: String, user: User) {
        self.token = token
        self.user = user
    }
}

// MARK: - User
class User: Codable {
    let id, roleID: Int?
    let fullName, name, email, photoURL: String?
    let createdAt, updatedAt, mobileNo: String?
    let age, gender, organizationID: Int?
    let location, checkInLocation, checkOutLocation: String?
    let busID, stopPointID, stopPointIDBack: Int?
    let identification, position: String?
    let tempStatus, checkIOOrg, isLoggedIn: Int?
    let hasCheckedIn, hasCheckedOut, hasAttended, hasAttendedBack: Bool?
    let hasAttendedBySupervisor, hasAttendedBackBySupervisor, hasArrivedBySupervisor: Bool?
    let photoLink: String?
    let hasBus: Bool?
    let organization: Organization?
    let roles: [Role]?
    let bus: PurpleBus?
    let stopPoint: JSONNull?

    enum CodingKeys: String, CodingKey {
        case id
        case roleID = "role_id"
        case fullName, name, email
        case photoURL = "PhotoUrl"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case mobileNo = "MobileNo"
        case age = "Age"
        case gender = "Gender"
        case organizationID = "OrganizationId"
        case location = "Location"
        case checkInLocation = "CheckInLocation"
        case checkOutLocation = "CheckOutLocation"
        case busID = "BusId"
        case stopPointID = "stopPointId"
        case stopPointIDBack = "stopPointIdBack"
        case identification, position, tempStatus, checkIOOrg, isLoggedIn, hasCheckedIn, hasCheckedOut, hasAttended, hasAttendedBack, hasAttendedBySupervisor, hasAttendedBackBySupervisor, hasArrivedBySupervisor
        case photoLink = "PhotoLink"
        case hasBus = "HasBus"
        case organization = "Organization"
        case roles, bus
        case stopPoint = "stop_point"
    }

    init(id: Int, roleID: Int, fullName: String, name: String, email: String, photoURL: String, createdAt: String, updatedAt: String, mobileNo: String, age: Int, gender: Int, organizationID: Int, location: String, checkInLocation: String, checkOutLocation: String, busID: Int, stopPointID: Int, stopPointIDBack: Int, identification: String, position: String, tempStatus: Int, checkIOOrg: Int, isLoggedIn: Int, hasCheckedIn: Bool, hasCheckedOut: Bool, hasAttended: Bool, hasAttendedBack: Bool, hasAttendedBySupervisor: Bool, hasAttendedBackBySupervisor: Bool, hasArrivedBySupervisor: Bool, photoLink: String, hasBus: Bool, organization: Organization, roles: [Role], bus: PurpleBus, stopPoint: JSONNull?) {
        self.id = id
        self.roleID = roleID
        self.fullName = fullName
        self.name = name
        self.email = email
        self.photoURL = photoURL
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.mobileNo = mobileNo
        self.age = age
        self.gender = gender
        self.organizationID = organizationID
        self.location = location
        self.checkInLocation = checkInLocation
        self.checkOutLocation = checkOutLocation
        self.busID = busID
        self.stopPointID = stopPointID
        self.stopPointIDBack = stopPointIDBack
        self.identification = identification
        self.position = position
        self.tempStatus = tempStatus
        self.checkIOOrg = checkIOOrg
        self.isLoggedIn = isLoggedIn
        self.hasCheckedIn = hasCheckedIn
        self.hasCheckedOut = hasCheckedOut
        self.hasAttended = hasAttended
        self.hasAttendedBack = hasAttendedBack
        self.hasAttendedBySupervisor = hasAttendedBySupervisor
        self.hasAttendedBackBySupervisor = hasAttendedBackBySupervisor
        self.hasArrivedBySupervisor = hasArrivedBySupervisor
        self.photoLink = photoLink
        self.hasBus = hasBus
        self.organization = organization
        self.roles = roles
        self.bus = bus
        self.stopPoint = stopPoint
    }
}

// MARK: - PurpleBus
class PurpleBus: Codable {
    let id: Int?
    let busNumber: String?
    let capacity, routeID, organizationID, supervisorID: Int?
    let driverID, isactive: Int?
    let createdAt, updatedAt: String?
    let route: Route?
    let organization: Organization?
    let users: [Driver]?
    let supervisor, driver: Driver?

    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case busNumber, capacity
        case routeID = "routeId"
        case organizationID = "organizationId"
        case supervisorID = "supervisorId"
        case driverID = "driverId"
        case isactive
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case route, organization, users, supervisor, driver
    }

    init(id: Int, busNumber: String, capacity: Int, routeID: Int, organizationID: Int, supervisorID: Int, driverID: Int, isactive: Int, createdAt: String, updatedAt: String, route: Route, organization: Organization, users: [Driver], supervisor: Driver, driver: Driver) {
        self.id = id
        self.busNumber = busNumber
        self.capacity = capacity
        self.routeID = routeID
        self.organizationID = organizationID
        self.supervisorID = supervisorID
        self.driverID = driverID
        self.isactive = isactive
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.route = route
        self.organization = organization
        self.users = users
        self.supervisor = supervisor
        self.driver = driver
    }
}

// MARK: - StopPoint
class StopPoint: Codable {
    let id, routeID: Int?
    let lat, lng, northEastLat, northEastLng: Double?
    let southWestLat, southWestLng: Double?
    let minsfromprevious, direction: Int?
    let createdAt, updatedAt: RouteCreatedAt?
    let stopPointID: Int?
    let users, usersBack: [Driver]?

    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case routeID = "routeId"
        case lat, lng
        case northEastLat = "northEast_lat"
        case northEastLng = "northEast_lng"
        case southWestLat = "southWest_lat"
        case southWestLng = "southWest_lng"
        case minsfromprevious, direction
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case stopPointID = "stopPointId"
        case users
        case usersBack = "users_back"
    }

    init(id: Int, routeID: Int, lat: Double, lng: Double, northEastLat: Double, northEastLng: Double, southWestLat: Double, southWestLng: Double, minsfromprevious: Int, direction: Int, createdAt: RouteCreatedAt, updatedAt: RouteCreatedAt, stopPointID: Int, users: [Driver], usersBack: [Driver]) {
        self.id = id
        self.routeID = routeID
        self.lat = lat
        self.lng = lng
        self.northEastLat = northEastLat
        self.northEastLng = northEastLng
        self.southWestLat = southWestLat
        self.southWestLng = southWestLng
        self.minsfromprevious = minsfromprevious
        self.direction = direction
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.stopPointID = stopPointID
        self.users = users
        self.usersBack = usersBack
    }
}

// MARK: - Route
class Route: Codable {
    let id: Int?
    let name: RouteName?
    let routePath, routePathBack: [DropoffLocation]?
    let pickupLocation, pickupLocationBack, dropoffLocation, dropoffLocationBack: DropoffLocation?
    let timeToDest: Int?
    let createdAt, updatedAt: RouteCreatedAt?
    let stopPoints: [StopPoint]?

    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case name, routePath, routePathBack, pickupLocation, pickupLocationBack, dropoffLocation, dropoffLocationBack, timeToDest
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case stopPoints = "stop_points"
    }

    init(id: Int, name: RouteName, routePath: [DropoffLocation], routePathBack: [DropoffLocation], pickupLocation: DropoffLocation, pickupLocationBack: DropoffLocation, dropoffLocation: DropoffLocation, dropoffLocationBack: DropoffLocation, timeToDest: Int, createdAt: RouteCreatedAt, updatedAt: RouteCreatedAt, stopPoints: [StopPoint]?) {
        self.id = id
        self.name = name
        self.routePath = routePath
        self.routePathBack = routePathBack
        self.pickupLocation = pickupLocation
        self.pickupLocationBack = pickupLocationBack
        self.dropoffLocation = dropoffLocation
        self.dropoffLocationBack = dropoffLocationBack
        self.timeToDest = timeToDest
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.stopPoints = stopPoints
    }
}

// MARK: - DriverBus
class DriverBus: Codable {
    let id: Int?
    let busNumber: String?
    let capacity, routeID, organizationID, supervisorID: Int?
    let driverID, isactive: Int?
    let createdAt, updatedAt: String?
    let route: Route?

    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case busNumber, capacity
        case routeID = "routeId"
        case organizationID = "organizationId"
        case supervisorID = "supervisorId"
        case driverID = "driverId"
        case isactive
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case route
    }

    init(id: Int, busNumber: String, capacity: Int, routeID: Int, organizationID: Int, supervisorID: Int, driverID: Int, isactive: Int, createdAt: String, updatedAt: String, route: Route) {
        self.id = id
        self.busNumber = busNumber
        self.capacity = capacity
        self.routeID = routeID
        self.organizationID = organizationID
        self.supervisorID = supervisorID
        self.driverID = driverID
        self.isactive = isactive
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.route = route
    }
}

// MARK: - Driver
class Driver: Codable {
    let id, roleID: Int?
    let fullName, name, email, photoURL: String?
    let createdAt, updatedAt, mobileNo: String?
    let age, gender, organizationID: Int?
    let location, checkInLocation, checkOutLocation: String?
    let busID, stopPointID, stopPointIDBack: Int?
    let identification, position: String?
    let tempStatus, checkIOOrg, isLoggedIn: Int?
    let hasAttendedBySupervisor, hasAttendedBackBySupervisor, hasAttended, hasAttendedBack: Bool?
    let hasArrivedBySupervisor, hasCheckedIn, hasCheckedOut: Bool?
    let photoLink: String?
    let hasBus: Bool?
    let organization: Organization?
    let bus: DriverBus?
    let connectionID: String?
    let roles: [Role]?

    enum CodingKeys: String, CodingKey {
        case id
        case roleID = "role_id"
        case fullName, name, email
        case photoURL = "PhotoUrl"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case mobileNo = "MobileNo"
        case age = "Age"
        case gender = "Gender"
        case organizationID = "OrganizationId"
        case location = "Location"
        case checkInLocation = "CheckInLocation"
        case checkOutLocation = "CheckOutLocation"
        case busID = "BusId"
        case stopPointID = "stopPointId"
        case stopPointIDBack = "stopPointIdBack"
        case identification, position, tempStatus, checkIOOrg, isLoggedIn, hasAttendedBySupervisor, hasAttendedBackBySupervisor, hasAttended, hasAttendedBack, hasArrivedBySupervisor, hasCheckedIn, hasCheckedOut
        case photoLink = "PhotoLink"
        case hasBus = "HasBus"
        case organization = "Organization"
        case bus
        case connectionID = "connectionId"
        case roles
    }

    init(id: Int, roleID: Int, fullName: String, name: String, email: String, photoURL: String, createdAt: String, updatedAt: String, mobileNo: String, age: Int, gender: Int, organizationID: Int, location: String, checkInLocation: String, checkOutLocation: String, busID: Int, stopPointID: Int, stopPointIDBack: Int, identification: String, position: String, tempStatus: Int, checkIOOrg: Int, isLoggedIn: Int, hasAttendedBySupervisor: Bool, hasAttendedBackBySupervisor: Bool, hasAttended: Bool, hasAttendedBack: Bool, hasArrivedBySupervisor: Bool, hasCheckedIn: Bool, hasCheckedOut: Bool, photoLink: String, hasBus: Bool, organization: Organization, bus: DriverBus, connectionID: String?, roles: [Role]?) {
        self.id = id
        self.roleID = roleID
        self.fullName = fullName
        self.name = name
        self.email = email
        self.photoURL = photoURL
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.mobileNo = mobileNo
        self.age = age
        self.gender = gender
        self.organizationID = organizationID
        self.location = location
        self.checkInLocation = checkInLocation
        self.checkOutLocation = checkOutLocation
        self.busID = busID
        self.stopPointID = stopPointID
        self.stopPointIDBack = stopPointIDBack
        self.identification = identification
        self.position = position
        self.tempStatus = tempStatus
        self.checkIOOrg = checkIOOrg
        self.isLoggedIn = isLoggedIn
        self.hasAttendedBySupervisor = hasAttendedBySupervisor
        self.hasAttendedBackBySupervisor = hasAttendedBackBySupervisor
        self.hasAttended = hasAttended
        self.hasAttendedBack = hasAttendedBack
        self.hasArrivedBySupervisor = hasArrivedBySupervisor
        self.hasCheckedIn = hasCheckedIn
        self.hasCheckedOut = hasCheckedOut
        self.photoLink = photoLink
        self.hasBus = hasBus
        self.organization = organization
        self.bus = bus
        self.connectionID = connectionID
        self.roles = roles
    }
}

enum RouteCreatedAt: String, Codable {
    case the20180407103252 = "2018-04-07 10:32:52"
}

// MARK: - DropoffLocation
class DropoffLocation: Codable {
    let lat, lng: Double?

    init(lat: Double, lng: Double) {
        self.lat = lat
        self.lng = lng
    }
}

enum RouteName: String, Codable {
    case bolaRoute = "Bola Route"
}

// MARK: - Organization
class Organization: Codable {
    let id: Int?
    let name: Name?
    let busesCount, usersCount: Int?
    let phoneNumber: String?
    let phoneNumber2: JSONNull?
    let permitCheckIn, driverAsSupervisor: Int?
    let lat, lng, northEastLat, northEastLng: Double?
    let southWestLat, southWestLng: Double?
    let createdAt, updatedAt: OrganizationCreatedAt?

    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case name = "Name"
        case busesCount = "BusesCount"
        case usersCount = "UsersCount"
        case phoneNumber, phoneNumber2, permitCheckIn, driverAsSupervisor, lat, lng
        case northEastLat = "northEast_lat"
        case northEastLng = "northEast_lng"
        case southWestLat = "southWest_lat"
        case southWestLng = "southWest_lng"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }

    init(id: Int, name: Name, busesCount: Int, usersCount: Int, phoneNumber: String, phoneNumber2: JSONNull?, permitCheckIn: Int, driverAsSupervisor: Int, lat: Double, lng: Double, northEastLat: Double, northEastLng: Double, southWestLat: Double, southWestLng: Double, createdAt: OrganizationCreatedAt, updatedAt: OrganizationCreatedAt) {
        self.id = id
        self.name = name
        self.busesCount = busesCount
        self.usersCount = usersCount
        self.phoneNumber = phoneNumber
        self.phoneNumber2 = phoneNumber2
        self.permitCheckIn = permitCheckIn
        self.driverAsSupervisor = driverAsSupervisor
        self.lat = lat
        self.lng = lng
        self.northEastLat = northEastLat
        self.northEastLng = northEastLng
        self.southWestLat = southWestLat
        self.southWestLng = southWestLng
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}

enum OrganizationCreatedAt: String, Codable {
    case the20180407102350 = "2018-04-07 10:23:50"
}

enum Name: String, Codable {
    case bola = "Bola"
}

// MARK: - Role
class Role: Codable {
    let id: Int?
    let name: RoleName?
    let createdAt, updatedAt: RoleCreatedAt?
    let pivot: Pivot?

    enum CodingKeys: String, CodingKey {
        case id, name
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case pivot
    }

    init(id: Int, name: RoleName, createdAt: RoleCreatedAt, updatedAt: RoleCreatedAt, pivot: Pivot) {
        self.id = id
        self.name = name
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.pivot = pivot
    }
}

enum RoleCreatedAt: String, Codable {
    case the20170812140000 = "2017-08-12 14:00:00"
}

enum RoleName: String, Codable {
    case drivers = "Drivers"
    case supervisors = "Supervisors"
    case users = "Users"
}

// MARK: - Pivot
class Pivot: Codable {
    let userID, roleID: Int?

    enum CodingKeys: String, CodingKey {
        case userID = "user_id"
        case roleID = "role_id"
    }

    init(userID: Int, roleID: Int) {
        self.userID = userID
        self.roleID = roleID
    }
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
