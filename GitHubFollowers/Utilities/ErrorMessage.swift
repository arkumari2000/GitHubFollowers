//
//  ErrorMessage.swift
//  GitHubFollowers
//
//  Created by Archana Kumari on 29/07/25.
//

import Foundation

enum ErrorMessage: String {
    case invalidRequest = "This username created an invalid request. Please try again"
    case unableToComplete = "Unable to complete your request. Please check your internet connection"
    case invalidResponse = "Invalid response from server. Please try again"
    case invalidData = "The data received from the server was invalid. Please try again"
}
