
        //------------------------------------------------------------- *

        Ctl-Opt BndDir('NOXDB') dftactgrp(*NO) ACTGRP('QILE' );

        //------------------------------------------------------------- *

        /include 'headers/JSONPARSER.rpgle'
        Dcl-S pJson1       Pointer;
        Dcl-S pJson2       Pointer;
        Dcl-S msg          Varchar(50);

        //------------------------------------------------------------- *

        *inlr = *on;

        pJson1 = Json_ParseString ('                            -
           {                                                    -
              x : {                                             -
                a : 1                                           -
              }                                                 -
           }                                                    -
        ');

        pJson2 = Json_ParseString ('                            -
           {                                                    -
              x : {                                             -
                b : 2                                           -
              }                                                 -
           }                                                    -
        ');

        Json_merge (pJson1 : pJson2  : Json_DONTREPLACE);

        Json_WriteStmf (pJson1:'./jsonout-merge-6i.json':1208:*OFF);
        Json_Close(pJson1);
        Json_Close(pJson2);
