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

    final WebViewController _controller = WebViewController();
    bool isPageLoaded = false;

    static const _informationFilePath = "assets/data/";
    static const _informationFileName = "information.html";
    static const _filename = _informationFilePath + _informationFileName;

    @override
    void initState() {
        super.initState();
        rootBundle.loadString(_filename).then((doc) =>
            _controller
            ..setNavigationDelegate(NavigationDelegate(
                onPageFinished: (String url) {
                    setState(() {
                        isPageLoaded = true;
                    });
                },
                onNavigationRequest: (NavigationRequest navigation) async {
                    if (await canLaunchUrl(Uri.parse(navigation.url))) {
                        await launchUrl(Uri.parse(navigation.url), mode: LaunchMode.externalApplication);
                    }
                    return NavigationDecision.prevent;
                }
            ))
            ..loadRequest(Uri.dataFromString(
                doc,
                mimeType: "text/html",
                encoding: Encoding.getByName("utf-8")
            ))

        );
    }

    @override
    Widget build(BuildContext context) {
        return Stack(
            children: [
                WebViewWidget(
                    controller: _controller
                ),
                if (!isPageLoaded) const Center(
                    child: CircularProgressIndicator()
                )
            ]
        );
    }

}
