package com.example.phone_number_suggestion_3
import android.annotation.SuppressLint
import android.app.Activity
import android.app.Activity.RESULT_OK
import android.app.PendingIntent
import android.content.Intent
import android.util.Log
import androidx.annotation.NonNull
import androidx.core.app.ActivityCompat.startIntentSenderForResult
import com.google.android.gms.auth.api.identity.GetPhoneNumberHintIntentRequest
import com.google.android.gms.auth.api.identity.Identity
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.ActivityResultListener

/** PhoneNumberHintPlugin  */
class PhoneNumberSuggestion_3Plugin : FlutterPlugin, MethodCallHandler, ActivityAware, ActivityResultListener {

    private lateinit var channel: MethodChannel
    private var activity: Activity? = null
    private var pendingResult: Result? = null
    private val logName = "PhoneNumberSuggestionPlugin"
    private val channelName = "phone_number_suggestion_3"
    private val HINT_BOTTOMSHEET = 1;
    private val HINT_DIALOG = 2;
    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, channelName)
        channel.setMethodCallHandler(this)
    }

    @SuppressLint("LongLogTag")
    override fun onMethodCall(call: MethodCall, @NonNull result: Result) {
        pendingResult = result
        if (call.method == "requestHint") {

            val request: GetPhoneNumberHintIntentRequest = GetPhoneNumberHintIntentRequest.builder().build()
            Identity.getSignInClient(activity!!)
                .getPhoneNumberHintIntent(request)
                .addOnSuccessListener { result: PendingIntent ->
                    try {

                        startIntentSenderForResult(
                            activity!!, result.intentSender, HINT_BOTTOMSHEET, null, 0, 0, 0, null
                        )
                    } catch (e: Exception) {
                        Log.e(logName, "PendingIntent failed")
                    }
                }
                .addOnFailureListener {
                    Log.e(logName, "Phone Number Hint failed")
                }

            return;
        }
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        activity = binding.activity as FlutterActivity
        binding.addActivityResultListener(this)
    }

    override fun onDetachedFromActivityForConfigChanges() {

    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        activity = binding.activity as FlutterActivity
        binding.addActivityResultListener(this)
    }

    override fun onDetachedFromActivity() {
        activity = null

    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }




    @SuppressLint("LongLogTag")
    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?): Boolean {
        Log.d(logName, "onActivityResult: requestCode: $requestCode")
        when (requestCode) {
            HINT_BOTTOMSHEET -> onHintRequest(resultCode, data)
        }
        return true
    }

    @SuppressLint("LongLogTag")
    private fun ignoreIllegalState(fn: () -> Unit) {
        try {
            fn()
        } catch (e: IllegalStateException) {
            Log.e(logName, "ignoring exception: $e")
        }
    }

    @SuppressLint("LongLogTag")
    private fun onHintRequest(resultCode: Int, data: Intent?) {
        if (resultCode == RESULT_OK && data != null) {
            try {
                val phoneNumber =
                    Identity.getSignInClient(activity!!).getPhoneNumberFromIntent(data)
                Log.d(logName, "onHintRequest - Phone number retrieved: $phoneNumber")
                val response = Response(phoneNumber, 200, ).toJson()
                ignoreIllegalState { pendingResult?.success(response) }
                return
            } catch (e: Exception) {
                Log.e(logName, "onHintRequest - Error while getting phone number: ${e.message}", e)
                val response: Response = Response( e.message.toString(), 420)
                ignoreIllegalState { pendingResult?.success(response.toJson()) }
            }
        } else {
            val response: Response = Response("Closed/back pressed by user", 204, )
            ignoreIllegalState {
                pendingResult?.success(response.toJson())
                Log.w(logName, "onHintRequest - Closed/back pressed by user")
            }
            ignoreIllegalState { pendingResult?.success(Response().toJson()) }
        }
    }
}

