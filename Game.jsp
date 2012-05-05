<%@page import="java.util.List"%>
<?xml version="1.0" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN"
    "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<jsp:useBean id="gameBean" class="webapp.model.Bean" scope="session" />

<html xmlns="http://www.w3.org/1999/xhtml"  xml:lang="de" lang="de">
    <head>
        <title>EWA Mensch &auml;rgere Dich nicht</title>
        <meta http-equiv="Content-Type" content="application/xhtml+xml; charset=utf-8"/>
        <meta name="description" content="Das EWA Mensch &auml;rgere Dich nicht, ein Spa&szlig; der niemals endet."/>
        <meta name="keywords" content="Spiel EWA Mensch &auml;rgere Dich nicht"/>
        <meta name="language" content="de-AT"/>
        <link rel="stylesheet" type="text/css" href="styles/screen.css"/>
        <%!
            public String getField(int fieldnumber, int locatedPlayer, int fieldcolor, boolean startingsquare, boolean homebase) {
                String title = "";
                String image = "field";

                if (fieldcolor != -1) {
                    image += fieldcolor;
                } else {
                    //first field, set color
                    if (fieldnumber == 1) {
                        image += 1;
                    }
                    if (fieldnumber == 11) {
                        image += 2;
                    }
                    if (fieldnumber == 21) {
                        image += 3;
                    }
                    if (fieldnumber == 31) {
                        image += 4;
                    }
                    //last field, set title
                    if (fieldnumber == 40) {
                        title = ": letztes Feld Spieler 1";
                    }
                    if (fieldnumber == 10) {
                        title = ": letztes Feld Spieler 2";
                    }
                    if (fieldnumber == 20) {
                        title = ": letztes Feld Spieler 3";
                    }
                    if (fieldnumber == 30) {
                        title = ": letztes Feld Spieler 4";
                    }
                    if (fieldnumber == 1) {
                        title = ": erstes Feld Spieler 1";
                    }
                    if (fieldnumber == 11) {
                        title = ": erstes Feld Spieler 2";
                    }
                    if (fieldnumber == 21) {
                        title = ": erstes Feld Spieler 3";
                    }
                    if (fieldnumber == 31) {
                        title = ": erstes Feld Spieler 4";
                    }
                }
                if (startingsquare) {
                    title = ": Startfeld Spieler " + fieldcolor;
                }
                if (homebase) {
                    title = ": Zielfeld Spieler " + fieldcolor;
                }
                if (locatedPlayer != -1) {
                    image += "_player" + locatedPlayer;
                    title += ": Spieler " + locatedPlayer;
                }

                return "<img id='field" + fieldnumber + "' src='img/" + image + ".png' alt='Feld " + fieldnumber + title + "' title='Feld " + fieldnumber + title + "' />";
            }
        %>                    
    </head>
    <body>
        <div id="wrapper">
            <div id="header">
                <div id="teaser"></div>
                <div id="logo"></div>
                <h1>EWA Mensch &auml;rgere Dich nicht</h1>
            </div>
            <ul class="accessibility">
                <li><a href="#navigation" accesskey="2">Navigation</a></li>
                <li><a href="#board" accesskey="0">Spielbrett</a></li>
                <li><a href="#board" accesskey="1">W&uuml;rfel</a></li>
                <li><a href="#info_area" accesskey="3">Spielstand</a></li>
            </ul>
            <div id="body">
                <div id="navigation">
                    <h2 class="accessibility">Navigation</h2>
                    <ul>
                        <li><a href="#">Userdaten &auml;ndern</a></li>
                        <li><a href="#">Zur&uuml;ck zur Lounge</a></li>
                        <li><a href="#">Ausloggen</a></li>
                    </ul>
                </div>
                <hr class="accessibility" />				
                <div id="info_area">

                    <% if (gameBean.isGameOver()) {%>
                    <form action="Servlet?action=new" method="post">
                        <input type="submit" value="Restart Game"/>
                    </form>
                    <%}%>

                    <h2>Spielinformationen</h2>

                    <table class="game_info" summary="Diese Tabelle zeigt Informationen zum aktuellen Spiel">
                        <tbody>
                            <tr class="accessibility">
                                <th>Information</th>
                                <th>Wert</th>
                            </tr>
                            <tr>
                                <th>Anzahl Spieler</th>
                                <td><%= gameBean.getPlayers().size()%></td>
                            </tr>
                            <tr>
                                <th>F&uuml;hrender</th>
                                <% if (gameBean.getLeader() == null) {%>
                                <td>mehrere</td>
                                <% } else {%>
                                <td><%= gameBean.getLeader().getName()%></td>
                                <% }%>
                            </tr>
                            <tr>
                                <th>Aktuelle Runde</th>
                                <td><%= gameBean.getRound()%></td>
                            </tr>
                            <tr>
                                <th>Zeit</th>
                                <td><%= gameBean.getTime()%></td>
                            </tr>
                        </tbody>
                    </table>

                    <h2>Spieler</h2>

                    <table class="game_info" summary="Diese Tabelle listet die Namen der Spieler auf">
                        <tbody>
                            <tr class="accessibility">
                                <th>Spielernummer</th>
                                <th>Spielername</th>
                            </tr>
                            <% if (gameBean.getPlayers().size() >= 1) {%>
                            <tr>
                                <th>Spieler 1</th>
                                <td><%= gameBean.getPlayers().get(0).getName()%></td>
                            </tr>
                            <% }%>
                            <% if (gameBean.getPlayers().size() >= 2) {%>
                            <tr>
                                <th>Spieler 2</th>
                                <td><%= gameBean.getPlayers().get(1).getName()%></td>
                            </tr>
                            <% }%>
                            <% if (gameBean.getPlayers().size() >= 3) {%>
                            <tr>
                                <th>Spieler 3</th>
                                <td><%= gameBean.getPlayers().get(2).getName()%></td>
                            </tr>
                            <% }%>
                            <% if (gameBean.getPlayers().size() >= 4) {%>
                            <tr>
                                <th>Spieler 4</th>
                                <td><%= gameBean.getPlayers().get(3).getName()%></td>
                            </tr>
                            <% }%>
                        </tbody>
                    </table>
                </div>
                <div id="dicearea">
                    <hr class="accessibility" />
                    <h2 class="accessibility">W&uuml;rfel</h2>
                    <span title="aktueller Spieler"><%= gameBean.getPlayers().get(0).getName()%></span>                            
                    <% if (gameBean.isGameOver() == false) {%>
                    <form action="Servlet?action=act" method="post">
                        <%}%>
                        <input type="image" name="wuerfel" title="W&uuml;rfel Zahl <%= gameBean.getScore()%>" 
                               src="img/wuerfel<%= gameBean.getScore()%>.png" alt="W&uuml;rfel Zahl <%= gameBean.getScore()%>"/>
                        <% if (gameBean.isGameOver() == false) {%>
                    </form>
                    <%}%>
                </div>
                <div id="play_area">
                    <hr class="accessibility" />
                    <div id="board">
                        <h2 class="accessibility">Spielbrett</h2>
                        <div class="fields">
                            <h3 class="accessibility">Spielfelder</h3>
                            <ol title="Spielfelder">
                                <%
                                    int fieldnumber = 1;
                                    while (fieldnumber <= 40) {
                                %>
                                <li><%=getField(fieldnumber, gameBean.isFieldOccupied(fieldnumber), -1, false, false)%></li>                                                      
                                <%      fieldnumber++;
                                    }
                                %>
                            </ol>
                            <h3 class="accessibility">Starth&auml;user</h3>
                            <%
                                int player = 1;
                                while (player <= 4) {
                            %>
                            <ol title="Starthaus Spieler <%=player%>">
                                <%  int housenumber = 1;
                                    while (housenumber <= 4) {
                                %>
                                <li><%=getField(fieldnumber, gameBean.isFieldOccupied(fieldnumber), player, true, false)%></li>
                                <%      housenumber++;
                                        fieldnumber++;
                                    }
                                %>
                            </ol>
                            <%
                                    player++;
                                }
                            %>                                    
                            <h3 class="accessibility">Zielh&auml;user</h3>                                    
                            <%
                                player = 1;
                                while (player <= 4) {
                            %>
                            <ol title="Zielhaus Spieler <%=player%>">
                                <%  int housenumber = 1;
                                    while (housenumber <= 4) {
                                %>
                                <li><%=getField(fieldnumber, gameBean.isFieldOccupied(fieldnumber), player, false, true)%></li>
                                <%      housenumber++;
                                        fieldnumber++;
                                    }
                                %>
                            </ol>
                            <%
                                    player++;
                                }
                            %>                                         
                        </div>
                        <div class="clearer"></div>
                        <% if (gameBean.getOpponentScore() == null) {%>
                        <div id="infogegner">W&uuml;rfelergebnis <%= gameBean.getPlayers().get(1).getName()%>: </div>
                        <% } else {%>
                        <div id="infogegner">
                            W&uuml;rfelergebnis <%= gameBean.getPlayers().get(1).getName()%>: 
                            <% if (gameBean.getOpponentScore().size() == 0) {%>
                            -
                            <%  }%>
                            <% for (int i = 0; i < gameBean.getOpponentScore().size(); ++i) {%>
                            <%=gameBean.getOpponentScore().get(i)%>
                            <% if (i < gameBean.getOpponentScore().size() - 1) {%> - <% }%>
                            <% }%>
                        </div>
                        <% }%>   
                    </div>
                </div>				
            </div>
            <div id="footer">
                <p>&copy; 2012 EWA Mensch &auml;rgere Dich nicht.</p>
            </div>
        </div>
    </body>
</html>