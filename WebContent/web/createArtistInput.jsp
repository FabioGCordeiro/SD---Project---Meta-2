<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 17/12/2018
  Time: 02:42
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Dropmusic - Create Artist</title>
    <script type="text/javascript">

        var websocket = null;

        window.onload = function() { // URI = ws://10.16.0.165:8080/WebSocket/ws
            connect('ws://' + window.location.host + '/ws');
        }

        function connect(host) { // connect to the host websocket
            if ('WebSocket' in window)
                websocket = new WebSocket(host);
            else if ('MozWebSocket' in window)
                websocket = new MozWebSocket(host);

            websocket.onopen    = onOpen; // set the 4 event listeners below
            websocket.onclose   = onClose;
            websocket.onmessage = onMessage;
            websocket.onerror   = onError;
        }

        function onOpen(event) {
            var username = "<%=session.getAttribute("username")%>";
            websocket.send(username);
        }

        function onClose(event) {
        }

        function onMessage(message) {
            alert(message.data);
        }

        function onError(event) {
        }

        function doSend() {
            var message = document.getElementById('chat').value;
            if (message != '')
                websocket.send(message); // send the message to the server
            document.getElementById('history').value = '';
        }

        function writeToHistory(text) {
            var history = document.getElementById('history');
            var line = document.createElement('p');
            line.style.wordWrap = 'break-word';
            line.innerHTML = text;
            history.appendChild("eheheheh");
            history.scrollTop = history.scrollHeight;
        }

    </script>

    <s:form action="createArtist" method="post">
        <s:text name="Artist:" />
        <s:textfield name="nameArtist"/><br><br>
        <s:text name="Description:" />
        <s:textfield name="descriptionArtist"/><br><br>
        Songwriter:
        <select name="songwriterArtist">
            <option value="0">Yes</option>
            <option value="1">No</option>
        </select><br><br>
        Composer:
        <select name="composerArtist">
            <option value="0">Yes</option>
            <option value="1">No</option>
        </select><br><br>
        Band:
        <select name="bandArtist">
            <option value="0">Yes</option>
            <option value="1">No</option>
        </select><br><br>
        <s:submit/>
    </s:form>
    <p><a href="<s:url action="menuPrincipal" />">Menu Principal</a></p>
</head>
<body>

</body>
</html>
