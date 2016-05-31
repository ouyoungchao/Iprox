<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>iProX_subContent</title>
    <link type="image/vnd.microsoft.icon" rel="shortcut icon" href="/Iprox/html/imgs/iprox.ico">
    <link rel="stylesheet" href="/Iprox/html/css/reset.css">
    <link rel="stylesheet" href="/Iprox/html/css/iProx_main2.css">
    <link rel="stylesheet" href="/Iprox/html/css/table.css">
    <link rel="stylesheet" href="/Iprox/html/css/ProPageTurn.css">
</head>
<body>
<!--[if lte IE 7]>
<p style="text-align:center; background:#000; color:#fff; margin:0; font-weight:bold;">
    您的浏览器版本过低，将对您的访问带来不便，请使用更高版本浏览器</p>
<![endif]-->
<input id="subproject-vie-data" type="hidden" value='${subProjectAll}'/>

<div id="header" class="comWidth">
    <ul class="nav clearfix" id="mainav">
        <li><a href="/Iprox">Home</a></li>
        <li><a href="/Iprox" class="current">Browse</a></li>
        <li><a href="#">Search</a></li>
        <li><a href="#">Submit</a></li>
        <li><a href="#">Log In/Out</a></li>
        <li><a href="#">Help</a></li>
    </ul>
    <h1>integrated Proteome resources</h1>
</div>
<div id="content_sub" class="comWidth clearfix">
    <div class="con_left" id="secnav">
        <ul>
            <li><a href="/Iprox">Home</a></li>
            <li><a href="/Iprox" class="active">Browse</a></li>
            <li><a href="#">Search</a></li>
            <li><a href="#">Submit</a></li>
            <li><a href="#">Log in</a></li>
            <li><a href="#">help</a></li>
        </ul>
    </div>
    <div class="con_right">
        <div id="tabModule" class="tabModule clearfix">
            <div class="tabswitch" id="tabSwitch">
                <a href="#" class="active">SubProject View</a>
                <a href="#">Protein</a>
                <a href="#">Peptide</a>
                <a href="#">Spectrum</a>
                <a href="#">Quantification</a>
                <a href="#">Summery Charts</a>
            </div>
            <div>
                <!--111111111111111111111111111111111111111111111-->
                <div class="sub_cont" style="display:block;">
                    <div>
                        <h1>SubProject Information</h1>
                        <table id="SubProject-Information">
                            <tbody></tbody>
                        </table>
                        <h1>Informatics Protocol</h1>
                        <table id="Informatics-Protocol">
                            <tbody></tbody>
                        </table>
                        <div id="de-of-in">
                            <h1>Details of MS Instrument</h1>
                            <table id="Ion-source">
                                <caption>Ion source</caption>
                                <tbody></tbody>
                            </table>
                            <table id="Analyzer">
                                <caption>Analyzer</caption>
                                <tbody></tbody>
                            </table>
                            <table id="Detectore">
                                <caption>Detectore</caption>
                                <tbody></tbody>
                            </table>
                        </div>
                        <div id="de-of-ex-pro">
                            <h1>Details of Experiment Protocol</h1>
                            <table id="Growth">
                                <caption>Growth</caption>
                                <tbody></tbody>
                            </table>
                            <table id="Treatmen">
                                <caption>Treatment</caption>
                                <tbody></tbody>
                            </table>
                            <table id="Digestion">
                                <caption>Digestion</caption>
                                <tbody></tbody>
                            </table>
                            <table id="Extraction">
                                <caption>Extraction</caption>
                                <tbody></tbody>
                            </table>
                            <table id="Acquisition">
                                <caption>Acquisition</caption>
                                <tbody></tbody>
                            </table>
                            <table id="Separation">
                                <caption>Separation</caption>
                                <tbody></tbody>
                            </table>
                            <table id="More-Information">
                                <caption>More Information</caption>
                                <tbody></tbody>
                            </table>
                        </div>
                        <h1>Details of Informatics Protocol</h1>
                        <table>
                            <tbody>
                            <tr>
                                <td width="20%" style="background-color:#a1d6f0;">Fragment mass tolerance setting</td>
                                <td width="80%">
                                    <table id="Fra-ma-to-set" class="childTable">
                                        <tbody></tbody>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td style="background-color:#aaebca;">Peptide mass tolerance setting</td>
                                <td>
                                    <table id="Pep-ma-to-set" class="childTable">
                                        <tbody></tbody>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td style="background-color:#a1d6f0;">Max missed cleavages</td>
                                <td>
                                    <table id="Ma-mi-cl" class="childTable">
                                        <tbody></tbody>
                                    </table>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>


                </div>
                <!--    SelectAllProtein Table-->
                <div class="sub_cont clearfix" style="display:none;">
                    <h2>Protein</h2>

                    <div id="itable" class="itable clearfix">
                        <table>
                            <thead   class="ithead">
                                <tr>
                                    <td>Protein ID/Accession</td>
                                    <td>Protein Name</td>
                                    <td>PSMs</td>
                                    <td>Distinct Peptides</td>
                                    <td>PTMs</td>
                                    <td>score</td>
                                    <td>Threshold</td>
                                    <td>Coverage</td>
                                    <td>Pl</td>
                                    <td>Protein ID</td>                                
                                </tr>
                            </thead>
                            <tbody  class="itbody"></tbody>
                        </table>
                        <div id="itside" class="itside" style="display:none">
                            <div id="itslider" class="itslider">
                                <div id="itslide" class="itslide"></div>
                            </div>
                        </div>
                    </div>
                    <!--qh-->
                    <div class="turnpagebox" id="protein-page-turn">
                        <a href="javascript:void(0)" class="PageTurn">Home</a>
                        <a href="javascript:void(0)" class="PageTurn">1</a>
                        <a href="javascript:void(0)" class="PageTurn">2</a>
                        <a href="javascript:void(0)" class="PageTurn">3</a>
                        <a href="javascript:void(0)" class="PageTurn" id="pro_next">next</a>
                        <a href="javascript:void(0)" class="PageTurn">end</a>
                        <span>total</span><label class="PageTurn ">21312</label><span>pages</span>
                        <span>go</span><label for="pro_pageid"><input type="text" class="PageTurn"></label><span>pages</span>
                        <a href="javascript:void(0)" class="PageTurn">OK</a>
                    </div>


                    <!--PeptideByProteinId Table-->

                    <h2>Protein[CYC_ALLM] Modified AAS:[G,K-144.1059]</h2>

                    <div id="itable1" class="itable">
                        <table>
                            <thead   class="ithead">
                            <tr>
                                <td>Peptide</td>
                                <td>Charge</td>
                                <td>Delta m/z</td>
                                <td>Identification Id</td>
                                <td>Length</td>
                                <td>#lons</td>
                                <td>Mascot Score</td>
                                <td>Modifications</td>
                                <td>Fit</td>
                                <td>PI</td>
                                <td>Precursor m/z</td>
                                <td>PSM</td>
                                <td>Start</td>
                                <td>Stop</td>
                                <td>Protein Id</td>
                                <td>Spectrum Id</td>
                            </tr>
                            </thead>
                            <tbody  class="itbody"></tbody>
                        </table>

                        <div id="itside" class="itside">
                            <button id="itselect" type="button"></button>
                            <div id="itslider" class="itslider">
                                <div id="itslide" class="itslide"></div>
                            </div>
                        </div>

                    </div>

                    <div id="tabModule2" class="tabModule clearfix">
                        <div class="tabswitch" id="tabSwitch">
                            <a href="#" class="active">Spectrum</a>
                            <a href="#">Fragmentation table</a>
                            <a href="#">Protein Sequence</a>
                        </div>
                        <div>
                            <div id="testgraph1" style="width:900px;"></div>

                            <div style="display:none">

                                <div id="itable2">
                                    <table>
                                        <thead   class="ithead">
                                        <tr>
                                            <td>#</td>
                                            <td>y</td>
                                            <td>y++</td>
                                            <td>y*</td>
                                            <td>y*++</td>
                                            <td>yo</td>
                                            <td>yo++</td>
                                            <td>Seq</td>
                                            <td>b</td>
                                            <td>b++</td>
                                            <td>b*</td>
                                            <td>b*++</td>
                                            <td>bo</td>
                                            <td>bo++</td>
                                            <td>#</td>
                                        </tr>
                                        </thead>
                                        <tbody  class="itbody">
                                        <tr>
                                            <td>1.12341</td>
                                            <td>456.456</td>
                                            <td>252.12</td>
                                            <td>2.324</td>
                                            <td>12.5323</td>
                                            <td>6.74</td>
                                            <td>99.2</td>
                                            <td>31.32</td>
                                            <td>456.456</td>
                                            <td>252.12</td>
                                            <td>2.324</td>
                                            <td>12.5323</td>
                                            <td>6.74</td>
                                            <td>99.2</td>
                                            <td>31.32</td>
                                        </tr>
                                        <tr>
                                            <td>99.2</td>
                                            <td>31.32</td>
                                            <td>2.324</td>
                                            <td>456.456</td>
                                            <td>252.12</td>
                                            <td>1.12341</td>
                                            <td>12.5323</td>
                                            <td>6.74</td>
                                        </tr>
                                        <tr>
                                            <td>1.12341</td>
                                            <td>456.456</td>
                                            <td>252.12</td>
                                            <td>2.324</td>
                                            <td>12.5323</td>
                                            <td>6.74</td>
                                            <td>99.2</td>
                                            <td>31.32</td>
                                        </tr>
                                        <tr>
                                            <td>99.2</td>
                                            <td>31.32</td>
                                            <td>2.324</td>
                                            <td>456.456</td>
                                            <td>252.12</td>
                                            <td>1.12341</td>
                                            <td>12.5323</td>
                                            <td>6.74</td>
                                        </tr>
                                        <tr>
                                            <td>1.12341</td>
                                            <td>456.456</td>
                                            <td>252.12</td>
                                            <td>2.324</td>
                                            <td>12.5323</td>
                                            <td>6.74</td>
                                            <td>99.2</td>
                                            <td>31.32</td>
                                        </tr>
                                        <tr>
                                            <td>99.2</td>
                                            <td>31.32</td>
                                            <td>2.324</td>
                                            <td>456.456</td>
                                            <td>252.12</td>
                                            <td>1.12341</td>
                                            <td>12.5323</td>
                                            <td>6.74</td>
                                        </tr>
                                        <tr>
                                            <td>1.12341</td>
                                            <td>456.456</td>
                                            <td>252.12</td>
                                            <td>2.324</td>
                                            <td>12.5323</td>
                                            <td>6.74</td>
                                            <td>99.2</td>
                                            <td>31.32</td>
                                        </tr>
                                        <tr>
                                            <td>99.2</td>
                                            <td>31.32</td>
                                            <td>2.324</td>
                                            <td>456.456</td>
                                            <td>252.12</td>
                                            <td>1.12341</td>
                                            <td>12.5323</td>
                                            <td>6.74</td>
                                        </tr>
                                        <tr>
                                            <td>1.12341</td>
                                            <td>456.456</td>
                                            <td>252.12</td>
                                            <td>2.324</td>
                                            <td>12.5323</td>
                                            <td>6.74</td>
                                            <td>99.2</td>
                                            <td>31.32</td>
                                        </tr>
                                        <tr>
                                            <td>99.2</td>
                                            <td>31.32</td>
                                            <td>2.324</td>
                                            <td>456.456</td>
                                            <td>252.12</td>
                                            <td>1.12341</td>
                                            <td>12.5323</td>
                                            <td>6.74</td>
                                        </tr>
                                        <tr>
                                            <td>1.12341</td>
                                            <td>456.456</td>
                                            <td>252.12</td>
                                            <td>2.324</td>
                                            <td>12.5323</td>
                                            <td>6.74</td>
                                            <td>99.2</td>
                                            <td>31.32</td>
                                        </tr>
                                        <tr>
                                            <td>99.2</td>
                                            <td>31.32</td>
                                            <td>2.324</td>
                                            <td>456.456</td>
                                            <td>252.12</td>
                                            <td>1.12341</td>
                                            <td>12.5323</td>
                                            <td>6.74</td>
                                        </tr>
                                        </tbody>
                                    </table>

                                    <div id="itside" class="itside">
                                        <button id="itselect" type="button"></button>
                                        <div id="itslider" class="itslider">
                                            <div id="itslide" class="itslide"></div>
                                        </div>
                                    </div>

                                </div>
                            </div>

                            <div style="display:none">3</div>
                        </div>
                    </div>
                </div>
                <!--selectAll peptide-->
                <div class="sub_cont clearfix" style="display:none;">
                    <h2>peptide</h2>

                    <div id="itable3" class="itable clearfix">
                        <table>
                            <thead   class="ithead">
                            <tr>
                                <td>Peptide</td>
                                <td>protein</td>
                                <td>Delta m/z</td>
                                <td>Charge</td>
                                <td>Precursor m/z</td>
                                <td>Modifications</td>
                                <td>#lons</td>
                                <td>score</td>
                                <td>Length</td>
                                <td>Start</td>
                                <td>Stop</td>
                                <td>PI</td>
                                <td>Spectrum Id</td>
                                <td>Protein Id</td>
                                <td>Peptide Id</td>
                            </tr>
                            </thead>
                            <tbody  class="itbody"></tbody>
                        </table>
                        <div id="itside" class="itside">
                            <button id="itselect" type="button"></button>
                            <div id="itslider" class="itslider">
                                <div id="itslide" class="itslide"></div>
                            </div>
                        </div>

                    </div>

                    <!-- qh -->
                    <div class="turnpagebox" id="peptide-page-turn">
                        <a href="javascript:void(0)" class="PepPageTurn">Home</a>
                        <a href="javascript:void(0)" class="PepPageTurn">1</a>
                        <a href="javascript:void(0)" class="PepPageTurn">2</a>
                        <a href="javascript:void(0)" class="PepPageTurn">3</a>
                        <a href="javascript:void(0)" class="PepPageTurn" id="pro_next">next</a>
                        <a href="javascript:void(0)" class="PepPageTurn">end</a>
                        <span>total</span><label class="PepPageTurn ">21312</label><span>pages</span>
                        <span>go</span><label for="pro_pageid"><input type="text" class="PepPageTurn"></label><span>pages</span>
                        <a href="javascript:void(0)" class="PepPageTurn">OK</a>
                    </div>
                    <h2>PSM</h2>
                    <!-- selectPeptideByPeptide -->
                    <div id="itable6" class="itable">
                        <table >
                            <thead   class="ithead">
                            <tr>
                                <td>Peptide</td>
                                <td>protein</td>
                                <td>Delta m/z</td>
                                <td>Charge</td>
                                <td>Precursor m/z</td>
                                <td>Modifications</td>
                                <td>#lons</td>
                                <td>score</td>
                                <td>Length</td>
                                <td>Start</td>
                                <td>Stop</td>
                                <td>Spectrum Id</td>
                                <td>Peptide Id</td>
                            </tr>
                            </thead>
                            <tbody  class="itbody"></tbody>
                        </table>

                        <div id="itside" class="itside">
                            <button id="itselect" type="button"></button>
                            <div id="itslider" class="itslider">
                                <div id="itslide" class="itslide"></div>
                            </div>
                        </div>


                    </div>
                    <div id="tabModule3" class="tabModule clearfix">
                        <div class="tabswitch" id="tabSwitch">
                            <a href="#" class="active">Spectrum</a>
                            <a href="#">Fragmentation table</a>
                            <a href="#">Protein Sequence</a>
                        </div>
                        <div>
                            <div id="testgraph" style="width:900px;"></div>
                            <div style="display:none">
                                <div id="itable5">
                                    <table>
                                        <thead   class="ithead">
                                        <tr>
                                            <td>Charge</td>
                                            <td>Identified</td>
                                            <td>MS Level</td>
                                            <td>#Peaks</td>
                                            <td>Precursor m/z</td>
                                            <td>Spectrum Id</td>
                                            <td>Sum of Intensity</td>
                                            
                                 <!--            <td>Spectrum Id</td>
                                            <td>MS Level</td>
                                            <td>Identified</td>
                                            <td>precursor Charge</td>
                                            <td>Precursor m/z</td>
                                            <td>Precursor Intensity</td>
                                            <td>Sum of Intensity</td>
                                            <td>#Peaks</td> -->
                                        </tr>
                                        </thead>
                                        <tbody  class="itbody">
                                        <tr>
                                            <td>1.12341</td>
                                            <td>456.456</td>
                                            <td>252.12</td>
                                            <td>2.324</td>
                                            <td>12.5323</td>
                                            <td>6.74</td>
                                            <td>99.2</td>
                                            <td>31.32</td>
                                            <td>456.456</td>
                                            <td>252.12</td>
                                            <td>2.324</td>
                                            <td>12.5323</td>
                                            <td>6.74</td>
                                            <td>99.2</td>
                                            <td>31.32</td>
                                        </tr>
                                        <tr>
                                            <td>99.2</td>
                                            <td>31.32</td>
                                            <td>2.324</td>
                                            <td>456.456</td>
                                            <td>252.12</td>
                                            <td>1.12341</td>
                                            <td>12.5323</td>
                                            <td>6.74</td>
                                        </tr>
                                        <tr>
                                            <td>1.12341</td>
                                            <td>456.456</td>
                                            <td>252.12</td>
                                            <td>2.324</td>
                                            <td>12.5323</td>
                                            <td>6.74</td>
                                            <td>99.2</td>
                                            <td>31.32</td>
                                        </tr>
                                        <tr>
                                            <td>99.2</td>
                                            <td>31.32</td>
                                            <td>2.324</td>
                                            <td>456.456</td>
                                            <td>252.12</td>
                                            <td>1.12341</td>
                                            <td>12.5323</td>
                                            <td>6.74</td>
                                        </tr>
                                        <tr>
                                            <td>1.12341</td>
                                            <td>456.456</td>
                                            <td>252.12</td>
                                            <td>2.324</td>
                                            <td>12.5323</td>
                                            <td>6.74</td>
                                            <td>99.2</td>
                                            <td>31.32</td>
                                        </tr>
                                        <tr>
                                            <td>99.2</td>
                                            <td>31.32</td>
                                            <td>2.324</td>
                                            <td>456.456</td>
                                            <td>252.12</td>
                                            <td>1.12341</td>
                                            <td>12.5323</td>
                                            <td>6.74</td>
                                        </tr>
                                        <tr>
                                            <td>1.12341</td>
                                            <td>456.456</td>
                                            <td>252.12</td>
                                            <td>2.324</td>
                                            <td>12.5323</td>
                                            <td>6.74</td>
                                            <td>99.2</td>
                                            <td>31.32</td>
                                        </tr>
                                        <tr>
                                            <td>99.2</td>
                                            <td>31.32</td>
                                            <td>2.324</td>
                                            <td>456.456</td>
                                            <td>252.12</td>
                                            <td>1.12341</td>
                                            <td>12.5323</td>
                                            <td>6.74</td>
                                        </tr>
                                        <tr>
                                            <td>1.12341</td>
                                            <td>456.456</td>
                                            <td>252.12</td>
                                            <td>2.324</td>
                                            <td>12.5323</td>
                                            <td>6.74</td>
                                            <td>99.2</td>
                                            <td>31.32</td>
                                        </tr>
                                        <tr>
                                            <td>99.2</td>
                                            <td>31.32</td>
                                            <td>2.324</td>
                                            <td>456.456</td>
                                            <td>252.12</td>
                                            <td>1.12341</td>
                                            <td>12.5323</td>
                                            <td>6.74</td>
                                        </tr>
                                        <tr>
                                            <td>1.12341</td>
                                            <td>456.456</td>
                                            <td>252.12</td>
                                            <td>2.324</td>
                                            <td>12.5323</td>
                                            <td>6.74</td>
                                            <td>99.2</td>
                                            <td>31.32</td>
                                        </tr>
                                        <tr>
                                            <td>99.2</td>
                                            <td>31.32</td>
                                            <td>2.324</td>
                                            <td>456.456</td>
                                            <td>252.12</td>
                                            <td>1.12341</td>
                                            <td>12.5323</td>
                                            <td>6.74</td>
                                        </tr>
                                        </tbody>
                                    </table>
                                    <div id="itside" class="itside">
                                        <button id="itselect" type="button"></button>
                                        <div id="itslider" class="itslider">
                                            <div id="itslide" class="itslide"></div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                            <div style="display:none">3</div>
                        </div>
                    </div>
                </div>
                <!--444444444444444444444444444444444444444444Spetrum Table-->
                <div class="sub_cont" style="display:none;">

                    <div style=" border:2px solid #08c; padding:20px; overflow:hidden">
                        <div id="testpragraph2" style="width:80%;"></div>
                    </div>
                    <div id="itable4">
                        <table>
                            <thead   class="ithead">
                            <tr>

                                <td>Spectrum Id</td>
                                <td>MS Level</td>
                                <td>Identified</td>
                                <td>precursor Charge</td>
                                <td>Precursor m/z</td>
                                <td>Precursor Intensity</td>
                                <td>Sum of Intensity</td>
                                <td>#Peaks</td>
                            </tr>
                            </thead>
                            <tbody  class="itbody">

                            </tbody>
                        </table>
                        <div id="itside" class="itside">
                            <button id="itselect" type="button"></button>
                            <div id="itslider" class="itslider">
                                <div id="itslide" class="itslide"></div>
                            </div>
                        </div>

                    </div>
                    <!-- qh -->
                    <div class="turnpagebox" id="spectrum-page-turn">
                        <a href="javascript:void(0)" class="SpePageTurn">Home</a>
                        <a href="javascript:void(0)" class="SpePageTurn">1</a>
                        <a href="javascript:void(0)" class="SpePageTurn">2</a>
                        <a href="javascript:void(0)" class="SpePageTurn">3</a>
                        <a href="javascript:void(0)" class="SpePageTurn" id="pro_next">next</a>
                        <a href="javascript:void(0)" class="SpePageTurn">end</a>
                        <span>total</span><label class="SpePageTurn ">21312</label><span>pages</span>
                        <span>go</span><label for="pro_pageid"><input type="text"
                                                                      class="SpePageTurn"></label><span>pages</span>
                        <a href="javascript:void(0)" class="SpePageTurn">OK</a>
                    </div>
                </div>

                <!--5555555555555555555555555555555555555555555-->
                <div class="sub_cont" style="display:none;">啥也没有</div>
                <!--6666666666666666666666666666666666666666666-->
                <div class="sub_cont" style="display:none;">
                    <div id="wrapper">
                        <ul id="gList">
                            <li><a href="javascript:;"></a>

                                <div id="g_1"></div>
                            </li>
                            <li><a href="javascript:;"></a>

                                <div id="g_2"></div>
                            </li>
                            <li><a href="javascript:;"></a>

                                <div id="g_3"></div>
                            </li>
                            <li><a href="javascript:;"></a>

                                <div id="g_4"></div>
                            </li>
                            <li><a href="javascript:;"></a>

                                <div id="g_5"></div>
                            </li>
                            <li><a href="javascript:;"></a>

                                <div id="g_6"></div>
                            </li>
                            <li><a href="javascript:;"></a>

                                <div id="g_7"></div>
                            </li>
                            <li><a href="javascript:;"></a>

                                <div id="g_8"></div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div id="footer" class="comWidth">
    <p>
        <span>You can email a support request to the iProX team at the BPRC.contact information iprox@iprox.org</span><br/>
        <span>Support by Beijing Proteome Research Center(BPRC)</span><br/>
        <span>京ICP备11036956号-5</span>
    </p>
</div>
<a id="backTop" href="javascript:scroll(0,0)"><img src="/Iprox/html/imgs/backtop.png"/></a>


<script src="/Iprox/html/js/main2.js"></script>
<script src="/Iprox/html/js/iTable.js"></script>
<script src="/Iprox/html/js/jquery-1.9.1.min.js"></script>
<script src="/Iprox/html/js/highcharts.js"></script>
<script src="/Iprox/html/js/lib.js"></script>
<script src="/Iprox/html/js/subProjectView.js"></script>
<script src="/Iprox/html/js/ajax-test.js"></script>
</body>
</html>