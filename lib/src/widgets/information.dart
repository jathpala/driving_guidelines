/// Copyright 2022, Jath Palasubramaniam. All rights reserved.
/// Licensed under the GNU General Public License (version 3).

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:webview_flutter/webview_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import 'index.dart';
import 'navigation.dart';
import 'options_menu.dart';

class Information extends StatefulWidget {
    const Information({ Key? key }): super(key: key);

    static const routeName = '/information';

    @override
    State<Information> createState() => _InformationState();
}

class _InformationState extends State<Information> {
    _InformationState();

    WebViewController? _controller;

    static const _informationFilePath = 'assets/data/';
    static const _informationFileName = 'information.html';

    void _loadHtml() async {
        const file = _informationFilePath + _informationFileName;
        String doc = await rootBundle.loadString(file);
        _controller?.loadUrl(Uri.dataFromString(
            doc,
            mimeType: 'text/html',
            encoding: Encoding.getByName('utf-8')
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
        return WillPopScope(
            onWillPop: () async {
                Navigator.pushReplacementNamed(
                    context,
                    Index.routeName
                );
                return false;
            },
            child: Scaffold(
                appBar: AppBar(
                    title: const Text('Information'),
                    automaticallyImplyLeading: false,
                    leading: null,
                    actions: const [OptionsMenu()]
                ),
                bottomNavigationBar: const Navigation(Information.routeName),
                body: WebView(
                    initialUrl: 'about:blank',
                    onWebViewCreated: (WebViewController webViewController) {
                        _controller = webViewController;
                        _loadHtml();
                    },
                    navigationDelegate: _launchUrl
                )
            )
        );
    }
}
