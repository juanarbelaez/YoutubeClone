//
//  NetworkError.swift
//  YoutubeClone
//
//  Created by Juan Arbelaez on 25/10/24.
//
import Foundation
enum NetworkError: String, Error{
    case invalidURL
    case serializationFailed
    case generic
    case couldNotDecodeData
    case httpResponseError
    case statusCodeError = "ocurrió un error al tratar de consultar el API: status code"
    case jsonDecoder = "Error al intentar extraer datos de json."
    case unauthorized
}
