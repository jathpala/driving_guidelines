// Copyright 2022-2024, Jath Palasubramaniam. All rights reserved.
// Licensed under the GNU General Public License (version 3).

import "dart:convert";

import "package:flutter/material.dart";
import "package:flutter/services.dart";

import "package:webview_flutter/webview_flutter.dart";
import "package:url_launcher/url_launcher.dart";

class InformationPage extends StatefulWidget {
    const InformationPage({ super.key });

    static const id = "information";
    static const title = "Information";

    @override
    State<InformationPage> createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
    _InformationPageState();

    WebViewController? _controller;

    static const _informationFilePath = "assets/data/";
    static const _informationFileName = "information.html";

    void _loadHtml() async {
        const file = _informationFilePath + _informationFileName;
        String doc = await rootBundle.loadString(file);
        _controller?.loadUrl(Uri.dataFromString(
            doc,
            mimeType: "text/html",
            encoding: Encoding.getByName("utf-8")
        ).toString());
    }

    Future<NavigationDecision> _launchUrl(NavigationRequest nav) async {
        if (await canLaunchUrl(Uri.parse(nav.url))) {
            await launchUrl(Uri.parse(nav.url), mode: LaunchMode.externalApplication);
        }
        return NavigationDecision.prevent;
    }

    @override
    Widget build(BuildContext context) {
        return WebView(
            initialUrl: "about:blank",
            onWebViewCreated: (WebViewController webViewController) {
                _controller = webViewController;
                _loadHtml();
            },
            navigationDelegate: _launchUrl
        );
    }
}
