package com.example.phone_number_suggestion_3

data class Response(
    var data: String = "",
    var statusCode: Int = 0,
) {
    companion object {
        fun fromJson(map: HashMap<String, Any>): Response {
            val phoneNumber = map["data"] as? String ?: ""
            val statusCode = map["statusCode"] as? Int ?: 0
            return Response(phoneNumber, statusCode)
        }
    }

    fun toJson(): HashMap<String, Any> {
        val map = HashMap<String, Any>()
        map["data"] = data
        map["statusCode"] = statusCode
        return map
    }
}