package com.example.webview_flutter_plugin


import android.app.Activity
import android.graphics.Color
import android.os.Build
import android.os.Bundle
import android.webkit.WebView
import android.webkit.WebViewClient
import android.widget.ImageView
import android.widget.Toolbar
class WebViewActivity : Activity() {
    private lateinit var webView: WebView
    override fun onCreate(savedInstanceState: Bundle?) {


        super.onCreate(savedInstanceState)
//        webView = WebView(this)
//
//        setContentView(webView)
        setContentView(R.layout.activity_web_view) // Use the layout XML file
       val backIcon = findViewById<ImageView>(R.id.backIcon)
        backIcon.setOnClickListener{
            onBackPressed()
        }



        webView = findViewById(R.id.webview)
        webView.webViewClient = WebViewClient()
        // Enable JavaScript (if you need it)
        webView.webViewClient = object : WebViewClient() {
            override fun shouldOverrideUrlLoading(view: WebView, url: String): Boolean {
                return false
            }
        }
        webView.settings.javaScriptEnabled = true
        webView.settings.allowUniversalAccessFromFileURLs
        webView.setBackgroundColor(Color.parseColor("#00305A"))

        webView.settings.allowFileAccess
        webView.settings.allowFileAccessFromFileURLs
        webView.settings.domStorageEnabled = true
        webView.settings.mediaPlaybackRequiresUserGesture = false
        webView.settings.allowContentAccess = true




        // Load the URL passed from Flutter
        val url = intent.getStringExtra("url")
        webView.loadUrl(url?:"")
    }
}