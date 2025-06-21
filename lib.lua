return (function(...)
    local C, D, a = table, string, bit
    local f, d, l, t, i, H, K, h, I, n, e =
        D.byte,
        D.char,
        D.sub,
        C.concat,
        C.insert,
        math.ldexp,
        getfenv and getfenv() or _ENV,
        setmetatable,
        select,
        unpack or C.unpack,
        tonumber
    local Y =
        (function(Y)
        local D, o, E, e, f, G, n = 1, function(E)
                local D = ""
                for e = 1, #E, 1 do
                    D = D .. d(f(E, e) - (18))
                end
                return e(D, 36)
            end, "", "", {}, 256, {}
        for D = 0, G - 1 do
            n[D] = d(D)
        end
        local function c()
            local E = o(l(Y, D, D))
            D = D + 1
            local e = o(l(Y, D, D + E - 1))
            D = D + E
            return e
        end
        E = d(c())
        f[1] = E
        while D < #Y do
            local D = c()
            if n[D] then
                e = n[D]
            else
                e = E .. l(E, 1, 1)
            end
            n[G] = E .. l(e, 1, 1)
            f[#f + 1], E, G = e, e, G + 1
        end
        return C.concat(f)
    end)(
        "DFCDGCDIGDGEDFjDIGDGCDGgDGiDHBDGeDGEDGTDIKDHcDGeDGVDHWDGeDG\\DGXDHFDGkDIWDFkDIKDHVDHCDGiDGaDI_DG[DGEDF]DIKDHXDGeDGZDHCDIbDGiDGVDGeDGfDHWDGVDHDDG\\DGiDGgDIWDGSDIKDICDGVDGVDGZDI^DI`DIbDJ[DIKDHjDHDDGkDGiDHCDIgDIiDI_DGEDGGDIKDHSDGiDHFDGVDHdDJWDHgDHGDHFDHCDGfDGEDGKDIKDHhDGiDGkDHHDGZDK]DHHDGEDIeDIGDHiDHDDGfDGUDHCDGeDIlDKdDGCDG\\DGeDGYDGUDHFDSDDGEDF_DIKDHgDJjDGkDKiDJJDGeDJlDHEDGVDHTDJjDGUDJeDIGDHVDI\\DJbDIaDIcDIlDKEDSaDI\\DHJDGVDKVDKIDHFDKkDIIDIKDHbDJJDGiDGEDJ\\DSiDGVDJEDGgDHFDG[DGVDG\\DGaDIXDIKDHlDGUDHBDGlDI_DSkDKVDTKDTGDTIDSdDJdDTFDIGDI^DJSDGBDGBDGEDF[DIKDHWDHGDHDDGXDGeDHCDFGDH_DHbDKkDTZDHDDGaDFGDSZDGVDG[DHYDGEDFiDKFDSXDG\\DT]DIGDHdDI_DSlDJHDGdDKCDSBDJEDGfDFGDKKDGbDKcDJDDK]DGkDHDDHDDHEDGEDGJDTGDJXDGgDVVDGhDHCDT\\DKZDKeDVUDHEDFGDSTDGVDGEDGIDK[DHCDVUDVFDICDJSDJZDUJDGgDVXDIKDHUDS_DGeDVdDHhDGeDIWDVYDIGDHhDGUDJ_DI_DV^DT\\DViDIGDKTDIbDHHDWSDFGDIEDJhDWdDT\\DWXDGCDHbDTXDVTDFGDWUDIdDSSDHDDHCDKjDGkDVgDVaDGCDWgDHFDHEDHVDXXDWGDSBDHgDV]DSHDHBDUbDUHDJKDJjDVJDIGDKGDKIDKKDG\\DHGDIKDGCDG[DYBDIKDF`DIGDGBDGCDYIDIGDFGDYHDYJDGCDGEDGCDYGDGCDGDDY[DYEDYVDY\\DYXDYZDYXDYKDGCDYTDYWDYgDYaDIGDIJDIJDYEDYXDIJDYiDY]DYdDYfDY\\DY`DYYDIGDUcDUcDYEDY\\DUcDYXDYfDIJDYIDFlDYeDZSDGCDIJDIeDYZDIeDXUDIKDUcDIeDZYDIGDZ]DYXDZbDIGDKZDWkDIKDZ]DKZDZEDIeDIYDYSD[CDGCDZ]D[BDGCDIYDTSDYBDKZD[KDYBDSBDZED[\\DIKDYfDVYD[VDZKDGCDJ\\DShDYBDVYDJ\\DZiDGCDVYDVYD[WDJ\\DGFDY^D[kDY^DXUDZEDVYD[]DYfDIYDZlD[fDKEDW`DYBDIYDKED\\BDIYDIYD[WDKEDGHDY^D\\^D\\IDIKDZED\\aD[bDIGDJ\\D[eDYZD\\HDF^DY^D\\GD\\fD\\iD[fDJ\\D\\VDIGDKED]DDIGDViDJCDYED\\[D]HD]KDIKD[iDIJDEbD]VDZKDSKD]cDGCDKEDFZDGCD]fD]dDFYD]kDGCD]gDKEDF\\D^DDIKD\\HDIGDVYD]gD\\HDUGD]lDGCD\\HDFfD^DD^UDGCDFeD^\\DIGD\\HDFhD^`D^YDGCDFgD^dD\\HDFbD^hDGCDFaD^kDFdD^kDFcD^DDGEDG`DGCD\\\\DZjDHTDGCD\\eDYIDYIDY\\DGCDFFDIKD[ED_[DIGD[]D_ZDIKD\\SD_ID]GDYXDIHD_IDJCD_YD[UD_TDYGDZ[DGCDVaD_^DGCDZUDIGD`FD[iD_aD]BDYBD`FD^KD`IDIKD]GDIKD`FD\\eD`[DIKDSBD`SDGCD][DGCDF^DE]D\\lDYGDFlD_lD`GDYVDYKD`FD_jD`iD^DDZ]D_XD`XD]YD`UDYFDaKDYjD`YD`fD`XDSKDaEDSKDIeDaHD`aD_KD`FDYZDaIDZ`DaVDIKDFIDaFD_TDSKDKZDYID_fD`FDYlDabD`HD`eDIKDFHDagD^DDVYD_WDabDYdDbFDIGDIFDSKD`bD]_DIGD^cDYUD__D^JDb[DYWDYdDKbDYdDXaDYdDGlDGEDYdDGVD_jDIKDCjDEgDblDGCDHfDC_DHfDKYDIKDJVDTYDG\\DX[DTkDGCDHBDJJDHGDXbDIGDV^DVUDUfDbCDFBDGfDFBDIlDZ]Dc]DJWDcYDVgDcfDGCDFBDFTDEdDGhDcdD]gDIGDGkDYVD`HDYbDYVDIGDYZDZJDdUDaUD_jDYZDUcDbCDYZDZ]D`HDIKDZ\\DYVDF`D[lD[UDIKDGID\\bD`dDdTDZ`DGUD`YDdTDGYDZFD[FDXlDYXD]GDaHDFjDeBDIGDeJDYeDFWDYEDIeDFGDElDYhDdfDeSD_bDYVDFEDE`DYgD^gDdbDe_DIGDeeDYYDEeDY]DXUDF`D^jDIJDWkDZZDacD_`Dd`DYBDIJDfJDY]DIHDdfDY]DeiDYjDeTD^fDYVDegDGCDFTDdcDekDY\\DfFDGWDY]DY\\D[KDYIDbCDZVDe]DFlDHKDaeDY_DdlDgDDfiDf[DFUDdcDJ\\DY\\D[ZDFGDHFDffD]hDYBDfTDZjDYVD_fDIGDY\\DZkDfWDY\\Df`DbSDf^DgdDYYDgSD^eDYSDICDgXDShDYIDfTDHeDdfDakDIGDGlDY]DgaDbZDdWDb\\DdaDY^DYJD^[DIHDSBDSbDGVDHaDGgDGgDKlDIfDI\\DTHDGVDTJD[ZDICDJJDGkDHGDJSDHdDG\\DHDDHBDcED\\iD[]DHXDGiDcUDGVDGaDheDTJD`HDIBDJKDHBDhbDTTDHKDGaDGZDIWD`ZDGCDI[DHEDI_DSXDGfDh]DiVDTfDXgDGeDHFDGgDHGDTUDGiDHEDJZDikDGCDJEDUSDG\\DG[DGeDHjDI_DGZDiGDcCDiGDcFDUgDGCDK\\DjVDHSDjBDjDDVgDbCDciDc[DbCDKjDG\\DjZDCTDCJDkDDkDDD]DcDDEcDkIDkJDCkDkHDkJDkIDESDcDDY^DFfDcIDibDI[DGVDjXDUSDJkDiDDGgDSDDG[DIlD`HDk_DUTDc\\DGCDc^DJWDXfDGCDh]DHjDTXDVgDWkDI^DXJDHVDcUDIcDEjDYBDFDDdkD[SD`lDYVDYfDg^D\\BDYXDYXDblDbSDYXDcfDYIDajDIKDf^DlgDf^DIYDYIDddDYgDfjDJCDl`D[bDfeDYcD`kDFGECBIDYgDZ]ECBSDfUDGCDKdDhFECBGDg`DHHDYgDJCDYdDf^ECB`DgFDIGDSKECBBDgiECBEDY]Dg^ECBWDZJDKZDFGDH`DgXD[ED`CDlZDYkD[XDZ^D`kDgTECCSDZ]DY\\DKEDYfD[_ECCSDIeDIeD`WDacDZhD[fDUcD\\\\DYfDZTD_UD[fDZ]DibDZcDbZDYEDKZDfjDZ_D[HECChD_JD\\lDdfDZ]D\\eECCkDaaDYZDKZDbYD[jDYgDlZD\\DDGCD]jDYfD[ZD\\BDJ\\DJ\\D^CD_\\D[gDY^DckDg^D`kDUcDZ]Dd^ECDHDlZDZ]DZ]D^HD`_DYEECCZECBYDGCDUGDYfDXUD``ECC]D`DECC\\ECEKDhZDIGECEXDd`D[eDYEDckDhXDYdDYBDGBD`]DYWD\\\\DHdDXXDGfECEjDjUDGVDWbDKWDGEDckDjcDjCDjEDGEDg^DIDDHcDjJECFIDjeDS]DHCDS_DcWDHiDGiDkeDcWDjhDkjDklDUfDXUDJVDHEDT`DTbDUfD`HECFZDS_Dj]ECBXDIKDH]DHfDiGDDVDEgDcWDHlDIUDIWD`HDciDhkDSJDIKDFBDFVDFVDcbDFWDdBDEgDcbDFXDFUDFGDEgDHHDGgDFBDFUDFSD[bDglDYdECBgECBjDYBDhJDaHDldDG_DdcDl[Df^DYGDYIDFGECHCDhWECBCDZIECHGDgEECHJECHSDgeDf[ECHVDYeECHYDYUECH[DacDIKECHHECHFDFlECHKECBBECHTECHbDl\\ECHeDgKDY]Dd`ECHjDZJECHlDYVD^CECHaDIKECIVECBdDGCDafECBBDekDldD[bDZXDYgD[WDY\\DXUDfGDYID[EDZJECI_DY]D_BECIWDIGECIlDghDY]D\\VD\\HECH\\DJ\\De[DhBDYBECBGDZYDeXECBGDTSECBFECDZDYeECBTD^aDYeECJUECDHDYZDIJECEgD]KDZDD[fECIdDY^ECJfDfkECBGDcfDY\\DFKDdkDf^ECKDDgHDIKDFJECIHDfgDYBD_iECJ[DGCDb]DlYDdaD_jECGDECFGDIKDHFDK`DSHDIlDYdDHSD\\\\DF`DG^Dl[DdXDe]DfkDhXECBGECCJDIKDllECJ\\ECEKECCWD[UDbHECIgDYVDIeDf^DbKECIZECSEECBWDdbDg`DFEDYgDUcDhHDf^ECS^DIGECBcECDiECKXECEdDdaD^_Dg_DhXDYWDckECK_DKHDjUDjJDk]ECFEDGfDSDDVWD_jDIBDG[DHeDcWDHKDVUDHCECGSECGUDKDDIZDI\\DHeDJ_DcUDGlDW[DIWDXUDiYDGeDHBDi^Di`DGED_jDh]DcJDSaDHaDHKDH[DHJDHJDIBDHbDlCDk]DijDXUDh]DG[DijD[iDh]DIBDHEDUSDS[DJWDT\\DbCDijDh\\DI\\ECTiDGeDiGDFCDcID`HDhfDGlDKjECK]DIGDXXDjVDG\\DVgDYdDHKDbiDT^ECVSDIGDHTECVUDGCDHSDUDECUCDGCECTfDHBECGTDIVDcWDG[DJWDGVDGfDYBDH[ECKYDdSDYdDdVECKVDaUDYBDfGDIJDblDfSDY^D_jDd\\DYBD_TECHWDglDKZECSTECJEDIYECIJECEYD\\XD[UECHKDKZDViECJBECDHECKHECVVDdTD^_DlgDYSDfeD\\EDfWDhFDKZD[DECW^ECEYECWTDf]Df[ECXGECHXECEYECEXECBCDIYDZeDhJD[aDYXDebECEYDhFECSKDf^ECX]ECHdECXSECEKDF`DYGD\\kECDBECCKECDiDVYECBkD^SD\\CECDfECDeECBGD[cECYBECCYECXlDVYD\\HECYFDVYD_KECD\\DZeDIYD_jECD_ECYBECJdD\\kD]CDb_DFVECKEDf[ECY`ECWdDf_ECWfECCKDfjDYIDJ\\D``Db_ECBGDGIDH_DdjDggDIYDgfECXHDIKECXGD^^ECCKDd`DGcECDfD[EECYlECKVECBGDIYDYZDJ\\D`cECYZDJ\\DaaDgYECSfDgjD`kD`ZD\\HDa[ECCSDViDVYD\\eECZgECD]ECDHEC[CD^CD_`DViECDDECCgECYkECDHECBGEC[CD^HDViD^]DVYDUGDIKD]IDfiECWSECYfDKZECEbECSKEC[SECDFDldDgJECWeDlfECIZECZKDHSDe]DKZDF`DIEECYBECZ_ECYID[fDb_ECZdD[ZDIJD`ZDJ\\ECZiDYfDKEECXTDaJECE\\D]`EC[TDdjECDfD]jDKEEC\\UDGCD^CDZeDKEEC[JD\\HEC[SD\\_DYgEC\\cD^HD`KD\\JDZ\\ECS\\ECJhECS_Df[DlgDF`DfbECClECSFECH\\ECShEC[^DYdD_HD`kDYEDHEECIIDlYDY\\ECZdECJjDgZECEKECEaECKYD`kECEbECSiECSjDdkEC]ZD\\iECTlDI\\ECVXDHTECShECSFDg^DZ\\ECB^DYXECSVDfZECDeECHWECBTDbSDFlEC^SECEKECBaDf[Da\\ECIZEC^UECDFECEdECJZECBkECJ]DYVECITDYXECBcECYdECBcECBWECBJEC^KECB_ECYaDIKECBcECEYECDiECSbECKjEC^ID]KECBlDg]ECSIDYgD^HDeKDf[EC_[DIGDE^ECWBEC_JDlYEC^eDYBECSeECKlDGBDWkDlCDSDDSFDUYECTkDIKDHJDG\\ECTYDckDHiDI\\DUJDKXDbCDHVDHkDHWECVKDSBDWCDGiDGfDIkECT\\DWaDVVDJKDS[DFJECUfDGEDibDGiDGZDJGDJIDSlDVVDFSDHIECVcDVWDbCDHhDKgDT\\D[]DIEDHWDHkDHlDHaDHEDVTEC`\\ECKeDlVECBJECKkDacD`ZDhUD]gECH\\DfjDbCDYID]gDIJD[eECa_D`kECacECEIDaUDfEDYBDaGECJiDdfDeIECSiECDCECJTDYgECZdECZdDYWDFBDbaECVDDGCECTBECKaDGEECDdDclDG[DFGECG^DdCDGhDFGECFUDFUDElDFGDESDC\\DETC`DcdDGTECbYDGhDchDJJECVXDHlECVXDHSEC^FDiGDCCDcID_jDG[DGUDGlDj[DkXDYBDDVDcHECbYDESC`DETDCZDETC\\DlCDVTDS[DWSDVgDHjDIKDITDIVDElDk]DTiDIcDFVDFDDHKDUTDJFECVdECdHDGeDFDECbgECdSDKjDGZECVdECTWDJlDIcECU\\DTYDjGECdIDEaDEdDE`DEjDEjDE^DE`DEiDE]DE`DEcDE^DEbDE`DE`DFKDFDDcWECdDECGVDIKDWgDGlDIBDKXDg^ECdYECbYECTgDTbDGfDkfDcKDKIECVCD]jDIGDESCGDETDCHECblDETDC\\DWfDHDDXXDFGDJVDFGDKUDVgD`HDVTDVkDG\\DcEDDVDD[DcIDckDGhDTDDKWDIlDbCDHEECT[DckDHTDIbDSlDXaD`HDGXDS^DIWDbCECV`DIWECSlDHEDJHDieECV[DbCDXWDVWDEgDIKDjEDJ`DG[DElDFSDFSDGhDI_DHEDFTDGWDGVDGhECaBECfDDieDG\\DEgDJGDK]DGeECeYDEeECdfECdhECdjECdlECeCECeEECeGDE`DFEECeTECdbDhfECaWECghDGfDEeDkjECV^Di\\DGCDHWDT`DcYDT[DGED_FDIGECTWDhfDHCECbhECbjECblECcCECTWDGZDFGDGhDG\\DSGDGVECbhDdBDdDECFUECcEDVUDJKDc`DcKDGeDGbECfJDK[DU\\ECfcDHiDYFECKgECSaECKiDhSD[^EC]gDgaECbJDIKD_VDYUDJ\\DdKDFXDgYECYYD]dEC\\gECZjECZTECCSD\\eDIYECEbDibDlZDJCDdiDeCD`cEC\\]DfVDZfECDfD]WECS\\Dd_EC_XECS`DeDDdfD`HDGIECgKDKZECIYDZ]Df^ECIYDf^DeiECXKECj]DVYDF`DHCECW\\DaSECYBD[ZD[FECYBD[IDgYDYEECDkEC]eD^_ECbEDIKDHdEC]eD\\KDbaDVYDd]Db_ECKeD`TECEgECZ`DdjDYZDKEECjVEC\\HEC\\bD[TD\\HD[EEC^UD\\]DlhD^EDb_DSKD]jD]gDIYD^CECEGD`TEC[JD[iDY\\D^FDGCD^[EC^HD^eECXkD^eD\\HD^gD`ZDKED^cD\\HEClZD^jD_BDb`DfVD^]D^[D_DDYZDViECh`D[fD\\eECkdDIGEDBHEC\\_DaJDViEC[BECJ^D^cD_KD\\\\DYXD]gDViD^[DYTD`ZDViD^cDd`ECEgEDB[EDBJECl[D_aDYZD]GDafDlZD]GD]GDfjECZbDYBDSKEC_KDZKECBGDIKDSKDiGD]GEDCGEC\\_D\\eD^cECjJDJ\\ECifDbFDIYDUGDTSDHUECYCDYVDEbDEhECDfDIFECbWEDC]DGCDbHDTSDGhECYBECSEDbFEC\\CECYBECYeD[GDdTEC_fDY^DFiD_DECjXDIHECSlECK`ECTDECb^DcdECbaECiFECbdECbfECheECbkECcBDG[ECcDECfZECcGECVIECVTECKcECcTDY^ECcVEC`CDIGECcYECc[DY^Dj\\DYEECc_ECfYDIKECcbECcdECcfECe]DTaDJSECeaDIGDSlDGVECVCD`WECegECeiECekECfBDI^DS[DkjECfSDJWECfVECfXECcEECf\\ECe`DcWECf`ECVaECfbECfdDHFECffDIKECfhECF[ECfjDT^ECfaECK^ECgDDXXDGeECV[DiXDiZEChYECh[DHBECh]DT\\EDBFEChbDJjEDDaEChgEDDdEChiEChkECiBDKIECiEECbcECiHEDDfDHDECiKDcWDJKECiVDkjDHhECiYDHFEDCeDdUECKgECCHECCbEC_aECkYEC]dD\\YDfjECifDYVECZGDYFECijDgiDlZECDbDacDYfEClBECBKDaJD[dDYBECJdECCSD]GECWkECieEDBSEC[\\DbaDIJD[YD[UECS\\ECCfEC]IECjYDYKDeEECWKD]YDHBECEYD^cDhDECIZEDH`ECXaECWKECkCECkED[JECkGDKZECkIECDEDYgECEBD`KDaUECkVECZSECi^DeUDfWDY^DSBECEdECWhECDYDaUD]gECYTECCgEDIXDdjECjVECYXD]^ECSiD]gEC\\VEC[DEC\\]ECl_DKED^GEC\\_ECDcDgYEDIaECESEDBgECjWDYgEClZDSKD^_EClcEC\\dECHhECJ^EClkECJ^DSKD^cEDBDDf\\DlZDViEC[IDYBECjJECKTEC_aD_eECKVECKUDYED]ZEC\\lECJ^D^CD_KDIYD\\HDYIDbFECkCECCKDGCEDCaD[]ECaeEDCeDIYD_BD_DEDJlDGCD^jD[KEDDBECXDEDJkD`fECC^ECEYECYeDZgEDDJDhWECJiEClUDWHDWaDHGDiKDK]EDGGD[iDXhDKJDKSDKUECFFDibDICDT`DjGECfDDGfDHXECiJDHVDiKDcjDSSDiCECT[DSBDHTDGeDXSDJWDEcEDECDGCDieDGWECGDDj]DcIDbCDhfDG[DKbDbCDGWDKHDbkDkCDkEDCJCUECGKECEgDlSDHDDGbEDFHDKIDGaEDTIDHBDGZEDSUECVEEDDYECKbDIKECVKDckEDSSECTIDVgEC^DDjfDJ]DGeEC`[DlCECaVDGiECVBDJSECGZDc]DSHDJFDiDEDTKDHBEDTTDGZDiDEDTWEDTBEDTDDCJDEYECGKDbCDIDDWcDGEECS\\DIGDHIECgbDFGDGfDXCDJWDGfDFTDh`DFSDHbDGbDE`DHdDEjDHaDIEDEiECUXEChkDJWDFGDSDECU^DJZDHlDYBDEcECWBDl]ECbSECCSECJ`ECJbECGEDfVECJfDZHDhWEDV`ECH\\EDVbDacEDV\\D`HECWEDdfDd[ECk\\ECEBDSBECCkDZeDaUECCaDIKECabEC\\_DZCDY]ECVlDfFECSiECKSEDV\\EDHkECHFECHWEC]jDl\\EDWUDY]EDVdDZEDUcEDIDEC]_DZEDIJECC_DZ_EC]bECBUEDJJDicDl\\ECWjECEYDW`DIBEDKCECDID\\kEDJkECXlECjGECCSDVYDKZD]GDcfDVYEDVVEC^^DIKEDXYECSFDWkEC^XECYBDVYDJCECXKECD\\DYaEDGgD`KDhJD\\JDYaDekDIYDfdECCKECXfDUGECSEEDX_EDXlDZKEC^[ECCKDgJEDXZDIGEDYSDejECCKECDXDYVDJ\\D[EDGjECXhECZIDIGDEfDfaEDX`ECBHEDYcD[KDUGECSVEDX_DVYDY\\D`hECB^EDXXEC_GDIGEDX\\EC]SECYBEDYYDYIEDI^DIKEDY]ECXjEDYbECD\\DYSDZ]ECD\\ECZ\\Db_ECeeECDYECBJECYFECW`EClEDbUEDXJECCKDYZEDZWEDXSEDDCD[fEDHTDYEEDZUEC]FDacECJDDZCDf[ECJDECZSECDDECXKECCJD^CECBCECEFDYBDf`ECagEDK_Db^DZBD\\SEDDXECTCDIlD[]Dk]DJlDIjECTDECUkEDTjECVCDbCECf[DHEEC`SEDFUECVaDX]EDKeDW\\DKXDX]DVVDieDXSDjJED[cDI_DHeDGfEC`\\DGfEDDUDYYECCaECZdDcEEDW_DYBDY\\EC[JDg^ECSCDIGD]jECI]ECEKECYYDH^ECEKECWXDe`ECWDECXlECj]ECEHEDZUDcfDIeECBfDlhDf[ED]JECBWDIeECEEECXaECEXED]VD_TEDX^ECDZD`FECEdD`FECEbDf`DIeEC^UD]jDfJDFlECS\\ECI_EDHXDg\\DYKD^_EC_KEC_CDYgECCCDglECBGED]ZDacDlcDabDYEED]^ED[WECBDED[ZDdkEDCHEDWjECl]DYBD^_DbSEDZSD]KDYKEDDKEDDSD\\iED[fEDTkDcWED[jED[lDIGECflDlCDKTDJJDJKED\\GDXHDHEED\\JDGVECEgDF`DIFED^_ECCSED^KDbaECCSECK[ECEeECHkDYUDlgECYdDljDf[ECWaECSFECBaECXaDbSECDkD_TD_jDhHDGCDHDEDK`ED^SED^VDaHED^bED`BECbUDfjED^\\DIKED^^DlYEDY]DfVED`FED[[DYEDUEDGC"
    )
    local D, C, E, e = 1, a and a.bxor or function(D, E)
                local e, C = 1, 0
                while D > 0 and E > 0 do
                    local n, l = D % 2, E % 2
                    if n ~= l then
                        C = C + e
                    end
                    D, E, e = (D - n) / 2, (E - l) / 2, e * 2
                end
                if D < E then
                    D = E
                end
                while D > 0 do
                    local E = D % 2
                    if E > 0 then
                        C = C + e
                    end
                    D, e = (D - E) / 2, e * 2
                end
                return C
            end, 181, function(E, D, e)
            if e then
                local D = (E / 2 ^ (D - 1)) % 2 ^ ((e - 1) - (D - 1) + 1)
                return D - D % 1
            else
                local D = 2 ^ (D - 1)
                return (E % (D + D) >= D) and 1 or 0
            end
        end
    local E, c, G = function()
            local e, l, f, n = f(Y, D, D + 3)
            e, l, f, n = C(e, E), C(l, E), C(f, E), C(n, E)
            D = D + 4
            return (n * 16777216) + (f * 65536) + (l * 256) + e
        end, function()
            local E = C(f(Y, D, D), E)
            D = D + 1
            return E
        end, function()
            local l, e = f(Y, D, D + 2)
            l, e = C(l, E), C(e, E)
            D = D + 2
            return (e * 256) + l
        end
    local function o()
        local C = E()
        local D = E()
        local l = 1
        local C = (e(D, 1, 20) * (2 ^ 32)) + C
        local E = e(D, 21, 31)
        local D = ((-1) ^ e(D, 32))
        if (E == 0) then
            if (C == 0) then
                return D * 0
            else
                E = 1
                l = 0
            end
        elseif (E == 2047) then
            return (C == 0) and (D * (1 / 0)) or (D * (0 / 0))
        end
        return H(D, E - 1023) * (l + (C / (2 ^ 52)))
    end
    local D, l = E, function(e)
            local n
            if (not e) then
                e = E()
                if (e == 0) then
                    return ""
                end
            end
            n = l(Y, D, D + e - 1)
            D = D + e
            local E = {}
            for D = 1, #n do
                E[D] = d(C(f(l(n, D, D)), 181))
            end
            return t(E)
        end
    local D, t = E, function(...)
            return {...}, I("#", ...)
        end
    local function H()
        local f, d, D = {}, {}, {}
        local Y = {f, d, nil, D}
        local D, C = E(), {}
        for e = 1, D do
            local E, D = c()
            if (E == 1) then
                D = (c() ~= 0)
            elseif (E == 3) then
                D = o()
            elseif (E == 2) then
                D = l()
            end
            C[e] = D
        end
        for d = 1, E() do
            local D = c()
            if (e(D, 1, 1) == 0) then
                local l, n, D = e(D, 2, 3), e(D, 4, 6), {G(), G(), nil, nil}
                if (l == 0) then
                    D[3] = G()
                    D[4] = G()
                elseif (l == 1) then
                    D[3] = E()
                elseif (l == 2) then
                    D[3] = E() - (2 ^ 16)
                elseif (l == 3) then
                    D[3] = E() - (2 ^ 16)
                    D[4] = G()
                end
                if (e(n, 1, 1) == 1) then
                    D[2] = C[D[2]]
                end
                if (e(n, 2, 2) == 1) then
                    D[3] = C[D[3]]
                end
                if (e(n, 3, 3) == 1) then
                    D[4] = C[D[4]]
                end
                f[d] = D
            end
        end
        for D = 1, E() do
            d[D - 1] = H()
        end
        Y[3] = c()
        return Y
    end
    local function a(D, Y, d)
        local E, e, D = D[1], D[2], D[3]
        return function(...)
            local C, I, l, c, E, f, K, G, H, o, e = E, e, D, t, 1, -1, {}, {...}, I("#", ...) - 1, {}, {}
            for D = 0, H do
                if (D >= l) then
                    K[D - l] = G[D + 1]
                else
                    e[D] = G[D + 1]
                end
            end
            local D = H - l + 1
            local D
            local l
            while true do
                D = C[E]
                l = D[1]
                if l <= 63 then
                    if l <= 31 then
                        if l <= 15 then
                            if l <= 7 then
                                if l <= 3 then
                                    if l <= 1 then
                                        if l == 0 then
                                            local D = D[2]
                                            e[D] = e[D](e[D + 1])
                                        else
                                            e[D[2]] = e[D[3]]
                                        end
                                    elseif l > 2 then
                                        local D = D[2]
                                        do
                                            return n(e, D, f)
                                        end
                                    else
                                        local f
                                        local l
                                        l = D[2]
                                        f = e[D[3]]
                                        e[l + 1] = f
                                        e[l] = f[D[4]]
                                        E = E + 1
                                        D = C[E]
                                        e[D[2]] = D[3]
                                        E = E + 1
                                        D = C[E]
                                        l = D[2]
                                        e[l] = e[l](n(e, l + 1, D[3]))
                                        E = E + 1
                                        D = C[E]
                                        e[D[2]] = d[D[3]]
                                        E = E + 1
                                        D = C[E]
                                        e[D[2]] = e[D[3]]
                                        E = E + 1
                                        D = C[E]
                                        l = D[2]
                                        e[l] = e[l](e[l + 1])
                                        E = E + 1
                                        D = C[E]
                                        if e[D[2]] then
                                            E = E + 1
                                        else
                                            E = D[3]
                                        end
                                    end
                                elseif l <= 5 then
                                    if l == 4 then
                                        local D = D[2]
                                        local C, E = c(e[D](e[D + 1]))
                                        f = E + D - 1
                                        local E = 0
                                        for D = D, f do
                                            E = E + 1
                                            e[D] = C[E]
                                        end
                                    else
                                        local l
                                        e[D[2]] = e[D[3]][D[4]]
                                        E = E + 1
                                        D = C[E]
                                        e[D[2]] = d[D[3]]
                                        E = E + 1
                                        D = C[E]
                                        e[D[2]] = e[D[3]][D[4]]
                                        E = E + 1
                                        D = C[E]
                                        l = D[2]
                                        e[l] = e[l](e[l + 1])
                                        E = E + 1
                                        D = C[E]
                                        if not e[D[2]] then
                                            E = E + 1
                                        else
                                            E = D[3]
                                        end
                                    end
                                elseif l == 6 then
                                    local l
                                    e[D[2]] = e[D[3]][D[4]]
                                    E = E + 1
                                    D = C[E]
                                    e[D[2]] = D[3]
                                    E = E + 1
                                    D = C[E]
                                    l = D[2]
                                    e[l](e[l + 1])
                                    E = E + 1
                                    D = C[E]
                                    e[D[2]] = e[D[3]][D[4]]
                                    E = E + 1
                                    D = C[E]
                                    e[D[2]] = Y[D[3]]
                                    E = E + 1
                                    D = C[E]
                                    e[D[2]][D[3]] = e[D[4]]
                                    E = E + 1
                                    D = C[E]
                                    e[D[2]] = d[D[3]]
                                    E = E + 1
                                    D = C[E]
                                    e[D[2]] = e[D[3]][D[4]]
                                    E = E + 1
                                    D = C[E]
                                    e[D[2]] = D[3]
                                    E = E + 1
                                    D = C[E]
                                    l = D[2]
                                    e[l](e[l + 1])
                                else
                                    local l, l
                                    local G
                                    local o, a
                                    local i
                                    local l
                                    e[D[2]] = d[D[3]]
                                    E = E + 1
                                    D = C[E]
                                    e[D[2]] = Y[D[3]]
                                    E = E + 1
                                    D = C[E]
                                    l = D[2]
                                    i = e[D[3]]
                                    e[l + 1] = i
                                    e[l] = i[D[4]]
                                    E = E + 1
                                    D = C[E]
                                    l = D[2]
                                    o, a = c(e[l](e[l + 1]))
                                    f = a + l - 1
                                    G = 0
                                    for D = l, f do
                                        G = G + 1
                                        e[D] = o[G]
                                    end
                                    E = E + 1
                                    D = C[E]
                                    l = D[2]
                                    o, G = {e[l](n(e, l + 1, f))}, 0
                                    for D = l, D[4] do
                                        G = G + 1
                                        e[D] = o[G]
                                    end
                                    E = E + 1
                                    D = C[E]
                                    E = D[3]
                                end
                            elseif l <= 11 then
                                if l <= 9 then
                                    if l > 8 then
                                        local C = D[2]
                                        local l, E = {e[C](e[C + 1])}, 0
                                        for D = C, D[4] do
                                            E = E + 1
                                            e[D] = l[E]
                                        end
                                    else
                                        e[D[2]] = (D[3] ~= 0)
                                    end
                                elseif l > 10 then
                                    e[D[2]] = D[3]
                                else
                                    if (D[2] <= e[D[4]]) then
                                        E = E + 1
                                    else
                                        E = D[3]
                                    end
                                end
                            elseif l <= 13 then
                                if l == 12 then
                                    do
                                        return
                                    end
                                else
                                    e[D[2]] = e[D[3]] * D[4]
                                end
                            elseif l == 14 then
                                e[D[2]] = e[D[3]] + D[4]
                            else
                                local D = D[2]
                                e[D](e[D + 1])
                            end
                        elseif l <= 23 then
                            if l <= 19 then
                                if l <= 17 then
                                    if l > 16 then
                                        do
                                            return e[D[2]]
                                        end
                                    else
                                        local G
                                        local f
                                        local l
                                        e[D[2]] = e[D[3]]
                                        E = E + 1
                                        D = C[E]
                                        e[D[2]] = {}
                                        E = E + 1
                                        D = C[E]
                                        e[D[2]] = {}
                                        E = E + 1
                                        D = C[E]
                                        e[D[2]] = {}
                                        E = E + 1
                                        D = C[E]
                                        e[D[2]][D[3]] = D[4]
                                        E = E + 1
                                        D = C[E]
                                        e[D[2]][D[3]] = D[4]
                                        E = E + 1
                                        D = C[E]
                                        e[D[2]] = {}
                                        E = E + 1
                                        D = C[E]
                                        e[D[2]] = {}
                                        E = E + 1
                                        D = C[E]
                                        e[D[2]][D[3]] = D[4]
                                        E = E + 1
                                        D = C[E]
                                        e[D[2]] = Y[D[3]]
                                        E = E + 1
                                        D = C[E]
                                        e[D[2]] = e[D[3]][D[4]]
                                        E = E + 1
                                        D = C[E]
                                        e[D[2]][D[3]] = e[D[4]]
                                        E = E + 1
                                        D = C[E]
                                        e[D[2]][D[3]] = D[4]
                                        E = E + 1
                                        D = C[E]
                                        e[D[2]] = {}
                                        E = E + 1
                                        D = C[E]
                                        e[D[2]][D[3]] = D[4]
                                        E = E + 1
                                        D = C[E]
                                        e[D[2]][D[3]] = e[D[4]]
                                        E = E + 1
                                        D = C[E]
                                        e[D[2]] = {}
                                        E = E + 1
                                        D = C[E]
                                        e[D[2]][D[3]] = D[4]
                                        E = E + 1
                                        D = C[E]
                                        e[D[2]] = D[3]
                                        E = E + 1
                                        D = C[E]
                                        l = D[2]
                                        f = e[D[3]]
                                        e[l + 1] = f
                                        e[l] = f[D[4]]
                                        E = E + 1
                                        D = C[E]
                                        e[D[2]] = Y[D[3]]
                                        E = E + 1
                                        D = C[E]
                                        e[D[2]] = e[D[3]]
                                        E = E + 1
                                        D = C[E]
                                        l = D[2]
                                        e[l] = e[l](e[l + 1])
                                        E = E + 1
                                        D = C[E]
                                        e[D[2]] = e[D[3]]
                                        E = E + 1
                                        D = C[E]
                                        l = D[2]
                                        e[l] = e[l](n(e, l + 1, D[3]))
                                        E = E + 1
                                        D = C[E]
                                        e[D[2]][D[3]] = e[D[4]]
                                        E = E + 1
                                        D = C[E]
                                        l = D[2]
                                        G = e[l]
                                        for D = l + 1, D[3] do
                                            i(G, e[D])
                                        end
                                    end
                                elseif l == 18 then
                                    local f
                                    local l
                                    e[D[2]] = D[3]
                                    E = E + 1
                                    D = C[E]
                                    l = D[2]
                                    e[l] = e[l](n(e, l + 1, D[3]))
                                    E = E + 1
                                    D = C[E]
                                    e[D[2]] = Y[D[3]]
                                    E = E + 1
                                    D = C[E]
                                    l = D[2]
                                    f = e[D[3]]
                                    e[l + 1] = f
                                    e[l] = f[D[4]]
                                    E = E + 1
                                    D = C[E]
                                    l = D[2]
                                    e[l] = e[l](e[l + 1])
                                    E = E + 1
                                    D = C[E]
                                    e[D[2]] = e[D[3]][D[4]]
                                    E = E + 1
                                    D = C[E]
                                    e[D[2]] = e[D[3]][D[4]]
                                    E = E + 1
                                    D = C[E]
                                    e[D[2]] = e[D[3]][D[4]]
                                    E = E + 1
                                    D = C[E]
                                    e[D[2]] = e[D[3]][e[D[4]]]
                                    E = E + 1
                                    D = C[E]
                                    e[D[2]] = Y[D[3]]
                                    E = E + 1
                                    D = C[E]
                                    e[D[2]] = e[D[3]][D[4]]
                                    E = E + 1
                                    D = C[E]
                                    e[D[2]] = e[D[3]][e[D[4]]]
                                    E = E + 1
                                    D = C[E]
                                    if e[D[2]] then
                                        E = E + 1
                                    else
                                        E = D[3]
                                    end
                                else
                                    e[D[2]] = (D[3] ~= 0)
                                end
                            elseif l <= 21 then
                                if l > 20 then
                                    local E = D[2]
                                    local l, C = {e[E](e[E + 1])}, 0
                                    for D = E, D[4] do
                                        C = C + 1
                                        e[D] = l[C]
                                    end
                                else
                                    local n = D[2]
                                    local C = {}
                                    for D = 1, #o do
                                        local D = o[D]
                                        for E = 0, #D do
                                            local E = D[E]
                                            local l = E[1]
                                            local D = E[2]
                                            if l == e and D >= n then
                                                C[D] = l[D]
                                                E[1] = C
                                            end
                                        end
                                    end
                                end
                            elseif l == 22 then
                                e[D[2]]()
                            else
                                e[D[2]]()
                            end
                        elseif l <= 27 then
                            if l <= 25 then
                                if l == 24 then
                                    e[D[2]] = e[D[3]] * D[4]
                                else
                                    e[D[2]] = Y[D[3]]
                                end
                            elseif l == 26 then
                                do
                                    return
                                end
                            else
                                local o
                                local d
                                local a, i
                                local G
                                local l
                                e[D[2]] = D[3]
                                E = E + 1
                                D = C[E]
                                l = D[2]
                                G = e[D[3]]
                                e[l + 1] = G
                                e[l] = G[D[4]]
                                E = E + 1
                                D = C[E]
                                e[D[2]] = e[D[3]][D[4]]
                                E = E + 1
                                D = C[E]
                                e[D[2]] = e[D[3]][D[4]]
                                E = E + 1
                                D = C[E]
                                e[D[2]] = Y[D[3]]
                                E = E + 1
                                D = C[E]
                                e[D[2]] = e[D[3]][D[4]]
                                E = E + 1
                                D = C[E]
                                l = D[2]
                                a, i = c(e[l](e[l + 1]))
                                f = i + l - 1
                                d = 0
                                for D = l, f do
                                    d = d + 1
                                    e[D] = a[d]
                                end
                                E = E + 1
                                D = C[E]
                                l = D[2]
                                e[l] = e[l](n(e, l + 1, f))
                                E = E + 1
                                D = C[E]
                                G = D[3]
                                o = e[G]
                                for D = G + 1, D[4] do
                                    o = o .. e[D]
                                end
                                e[D[2]] = o
                            end
                        elseif l <= 29 then
                            if l == 28 then
                                local G
                                local Y, o
                                local l
                                e[D[2]] = d[D[3]]
                                E = E + 1
                                D = C[E]
                                e[D[2]] = e[D[3]][D[4]]
                                E = E + 1
                                D = C[E]
                                e[D[2]] = e[D[3]]
                                E = E + 1
                                D = C[E]
                                l = D[2]
                                Y, o = c(e[l](e[l + 1]))
                                f = o + l - 1
                                G = 0
                                for D = l, f do
                                    G = G + 1
                                    e[D] = Y[G]
                                end
                                E = E + 1
                                D = C[E]
                                l = D[2]
                                e[l] = e[l](n(e, l + 1, f))
                                E = E + 1
                                D = C[E]
                                if e[D[2]] then
                                    E = E + 1
                                else
                                    E = D[3]
                                end
                            else
                                if not e[D[2]] then
                                    E = E + 1
                                else
                                    E = D[3]
                                end
                            end
                        elseif l > 30 then
                            local D = D[2]
                            e[D] = e[D](n(e, D + 1, f))
                        else
                            local E = D[2]
                            local C, D = c(e[E](n(e, E + 1, D[3])))
                            f = D + E - 1
                            local D = 0
                            for E = E, f do
                                D = D + 1
                                e[E] = C[D]
                            end
                        end
                    elseif l <= 47 then
                        if l <= 39 then
                            if l <= 35 then
                                if l <= 33 then
                                    if l == 32 then
                                        local C = D[2]
                                        local n = D[4]
                                        local l = C + 2
                                        local C = {e[C](e[C + 1], e[l])}
                                        for D = 1, n do
                                            e[l + D] = C[D]
                                        end
                                        local C = C[1]
                                        if C then
                                            e[l] = C
                                            E = D[3]
                                        else
                                            E = E + 1
                                        end
                                    else
                                        e[D[2]] = e[D[3]]
                                    end
                                elseif l > 34 then
                                    if (e[D[2]] < e[D[4]]) then
                                        E = D[3]
                                    else
                                        E = E + 1
                                    end
                                else
                                    if (D[2] <= e[D[4]]) then
                                        E = E + 1
                                    else
                                        E = D[3]
                                    end
                                end
                            elseif l <= 37 then
                                if l == 36 then
                                    local l
                                    e[D[2]] = d[D[3]]
                                    E = E + 1
                                    D = C[E]
                                    e[D[2]] = e[D[3]][D[4]]
                                    E = E + 1
                                    D = C[E]
                                    e[D[2]] = Y[D[3]]
                                    E = E + 1
                                    D = C[E]
                                    e[D[2]] = e[D[3]][D[4]]
                                    E = E + 1
                                    D = C[E]
                                    l = D[2]
                                    e[l] = e[l](n(e, l + 1, D[3]))
                                    E = E + 1
                                    D = C[E]
                                    if not e[D[2]] then
                                        E = E + 1
                                    else
                                        E = D[3]
                                    end
                                else
                                    local f, l
                                    local n
                                    e[D[2]] = D[3]
                                    E = E + 1
                                    D = C[E]
                                    e[D[2]] = d[D[3]]
                                    E = E + 1
                                    D = C[E]
                                    e[D[2]] = e[D[3]]
                                    E = E + 1
                                    D = C[E]
                                    n = D[2]
                                    f, l = {e[n](e[n + 1])}, 0
                                    for D = n, D[4] do
                                        l = l + 1
                                        e[D] = f[l]
                                    end
                                    E = E + 1
                                    D = C[E]
                                    E = D[3]
                                end
                            elseif l == 38 then
                                local l = D[2]
                                local n = D[4]
                                local C = l + 2
                                local l = {e[l](e[l + 1], e[C])}
                                for D = 1, n do
                                    e[C + D] = l[D]
                                end
                                local l = l[1]
                                if l then
                                    e[C] = l
                                    E = D[3]
                                else
                                    E = E + 1
                                end
                            else
                                e[D[2]] = Y[D[3]]
                                E = E + 1
                                D = C[E]
                                e[D[2]] = e[D[3]][D[4]]
                                E = E + 1
                                D = C[E]
                                e[D[2]] = e[D[3]][D[4]]
                                E = E + 1
                                D = C[E]
                                e[D[2]] = e[D[3]][D[4]]
                                E = E + 1
                                D = C[E]
                                e[D[2]] = e[D[3]][e[D[4]]]
                                E = E + 1
                                D = C[E]
                                if e[D[2]] then
                                    E = E + 1
                                else
                                    E = D[3]
                                end
                            end
                        elseif l <= 43 then
                            if l <= 41 then
                                if l > 40 then
                                    if (e[D[2]] <= e[D[4]]) then
                                        E = E + 1
                                    else
                                        E = D[3]
                                    end
                                else
                                    e[D[2]] = e[D[3]] * e[D[4]]
                                end
                            elseif l == 42 then
                                local o
                                local d
                                local a, i
                                local G
                                local l
                                e[D[2]] = D[3]
                                E = E + 1
                                D = C[E]
                                l = D[2]
                                G = e[D[3]]
                                e[l + 1] = G
                                e[l] = G[D[4]]
                                E = E + 1
                                D = C[E]
                                e[D[2]] = e[D[3]][D[4]]
                                E = E + 1
                                D = C[E]
                                e[D[2]] = e[D[3]][D[4]]
                                E = E + 1
                                D = C[E]
                                e[D[2]] = Y[D[3]]
                                E = E + 1
                                D = C[E]
                                e[D[2]] = e[D[3]][D[4]]
                                E = E + 1
                                D = C[E]
                                l = D[2]
                                a, i = c(e[l](e[l + 1]))
                                f = i + l - 1
                                d = 0
                                for D = l, f do
                                    d = d + 1
                                    e[D] = a[d]
                                end
                                E = E + 1
                                D = C[E]
                                l = D[2]
                                e[l] = e[l](n(e, l + 1, f))
                                E = E + 1
                                D = C[E]
                                G = D[3]
                                o = e[G]
                                for D = G + 1, D[4] do
                                    o = o .. e[D]
                                end
                                e[D[2]] = o
                            else
                                e[D[2]] = e[D[3]] / D[4]
                            end
                        elseif l <= 45 then
                            if l > 44 then
                                local E = D[2]
                                e[E](n(e, E + 1, D[3]))
                            else
                                E = D[3]
                            end
                        elseif l > 46 then
                            local D = D[2]
                            do
                                return n(e, D, f)
                            end
                        else
                            local E = D[2]
                            e[E](n(e, E + 1, D[3]))
                        end
                    elseif l <= 55 then
                        if l <= 51 then
                            if l <= 49 then
                                if l > 48 then
                                    e[D[2]] = e[D[3]] + e[D[4]]
                                else
                                    local C = D[3]
                                    local E = e[C]
                                    for D = C + 1, D[4] do
                                        E = E .. e[D]
                                    end
                                    e[D[2]] = E
                                end
                            elseif l > 50 then
                                local c, G
                                local f
                                local l
                                e[D[2]] = Y[D[3]]
                                E = E + 1
                                D = C[E]
                                e[D[2]] = e[D[3]][D[4]]
                                E = E + 1
                                D = C[E]
                                l = D[2]
                                f = e[D[3]]
                                e[l + 1] = f
                                e[l] = f[D[4]]
                                E = E + 1
                                D = C[E]
                                e[D[2]] = D[3]
                                E = E + 1
                                D = C[E]
                                l = D[2]
                                e[l] = e[l](n(e, l + 1, D[3]))
                                E = E + 1
                                D = C[E]
                                e[D[2]] = e[D[3]][D[4]]
                                E = E + 1
                                D = C[E]
                                e[D[2]] = e[D[3]][D[4]]
                                E = E + 1
                                D = C[E]
                                e[D[2]] = e[D[3]][D[4]]
                                E = E + 1
                                D = C[E]
                                e[D[2]] = d[D[3]]
                                E = E + 1
                                D = C[E]
                                e[D[2]] = e[D[3]][D[4]]
                                E = E + 1
                                D = C[E]
                                e[D[2]] = D[3]
                                E = E + 1
                                D = C[E]
                                e[D[2]] = D[3]
                                E = E + 1
                                D = C[E]
                                e[D[2]] = D[3]
                                E = E + 1
                                D = C[E]
                                l = D[2]
                                e[l] = e[l](n(e, l + 1, D[3]))
                                E = E + 1
                                D = C[E]
                                e[D[2]] = e[D[3]] + e[D[4]]
                                E = E + 1
                                D = C[E]
                                e[D[2]][D[3]] = e[D[4]]
                                E = E + 1
                                D = C[E]
                                e[D[2]] = d[D[3]]
                                E = E + 1
                                D = C[E]
                                e[D[2]] = e[D[3]][D[4]]
                                E = E + 1
                                D = C[E]
                                e[D[2]] = D[3]
                                E = E + 1
                                D = C[E]
                                l = D[2]
                                e[l](e[l + 1])
                                E = E + 1
                                D = C[E]
                                e[D[2]] = e[D[3]][D[4]]
                                E = E + 1
                                D = C[E]
                                e[D[2]] = e[D[3]][D[4]]
                                E = E + 1
                                D = C[E]
                                l = D[2]
                                f = e[D[3]]
                                e[l + 1] = f
                                e[l] = f[D[4]]
                                E = E + 1
                                D = C[E]
                                e[D[2]] = D[3]
                                E = E + 1
                                D = C[E]
                                l = D[2]
                                e[l] = e[l](n(e, l + 1, D[3]))
                                E = E + 1
                                D = C[E]
                                e[D[2]] = d[D[3]]
                                E = E + 1
                                D = C[E]
                                e[D[2]] = e[D[3]]
                                E = E + 1
                                D = C[E]
                                l = D[2]
                                c, G = {e[l](e[l + 1])}, 0
                                for D = l, D[4] do
                                    G = G + 1
                                    e[D] = c[G]
                                end
                                E = E + 1
                                D = C[E]
                                E = D[3]
                            else
                                if (e[D[2]] == D[4]) then
                                    E = E + 1
                                else
                                    E = D[3]
                                end
                            end
                        elseif l <= 53 then
                            if l > 52 then
                                e[D[2]][D[3]] = e[D[4]]
                            else
                                e[D[2]] = (D[3] ~= 0)
                                E = E + 1
                            end
                        elseif l > 54 then
                            local D = D[2]
                            local C, E = c(e[D](e[D + 1]))
                            f = E + D - 1
                            local E = 0
                            for D = D, f do
                                E = E + 1
                                e[D] = C[E]
                            end
                        else
                            if (e[D[2]] == D[4]) then
                                E = E + 1
                            else
                                E = D[3]
                            end
                        end
                    elseif l <= 59 then
                        if l <= 57 then
                            if l > 56 then
                                local D = D[2]
                                e[D] = e[D](e[D + 1])
                            else
                                local f
                                local l
                                e[D[2]] = d[D[3]]
                                E = E + 1
                                D = C[E]
                                e[D[2]] = {}
                                E = E + 1
                                D = C[E]
                                e[D[2]][D[3]] = e[D[4]]
                                E = E + 1
                                D = C[E]
                                e[D[2]][D[3]] = D[4]
                                E = E + 1
                                D = C[E]
                                e[D[2]] = {}
                                E = E + 1
                                D = C[E]
                                e[D[2]][D[3]] = D[4]
                                E = E + 1
                                D = C[E]
                                e[D[2]][D[3]] = e[D[4]]
                                E = E + 1
                                D = C[E]
                                e[D[2]] = Y[D[3]]
                                E = E + 1
                                D = C[E]
                                l = D[2]
                                f = e[D[3]]
                                e[l + 1] = f
                                e[l] = f[D[4]]
                                E = E + 1
                                D = C[E]
                                e[D[2]] = e[D[3]]
                                E = E + 1
                                D = C[E]
                                l = D[2]
                                e[l] = e[l](n(e, l + 1, D[3]))
                                E = E + 1
                                D = C[E]
                                e[D[2]][D[3]] = e[D[4]]
                                E = E + 1
                                D = C[E]
                                l = D[2]
                                e[l](e[l + 1])
                                E = E + 1
                                D = C[E]
                                do
                                    return
                                end
                            end
                        elseif l > 58 then
                            local D = D[2]
                            e[D] = e[D](n(e, D + 1, f))
                        else
                            e[D[2]] = e[D[3]] + D[4]
                        end
                    elseif l <= 61 then
                        if l > 60 then
                            e[D[2]] = d[D[3]]
                        else
                            local C = D[3]
                            local E = e[C]
                            for D = C + 1, D[4] do
                                E = E .. e[D]
                            end
                            e[D[2]] = E
                        end
                    elseif l > 62 then
                        if (D[2] < e[D[4]]) then
                            E = D[3]
                        else
                            E = E + 1
                        end
                    else
                        e[D[2]][D[3]] = D[4]
                    end
                elseif l <= 95 then
                    if l <= 79 then
                        if l <= 71 then
                            if l <= 67 then
                                if l <= 65 then
                                    if l == 64 then
                                        local E = D[2]
                                        local l, C = {e[E](n(e, E + 1, f))}, 0
                                        for D = E, D[4] do
                                            C = C + 1
                                            e[D] = l[C]
                                        end
                                    else
                                        e[D[2]] = e[D[3]][e[D[4]]]
                                    end
                                elseif l == 66 then
                                    e[D[2]] = D[3]
                                else
                                    local E = D[2]
                                    do
                                        return e[E](n(e, E + 1, D[3]))
                                    end
                                end
                            elseif l <= 69 then
                                if l == 68 then
                                    if (D[2] < e[D[4]]) then
                                        E = E + 1
                                    else
                                        E = D[3]
                                    end
                                else
                                    if (e[D[2]] ~= e[D[4]]) then
                                        E = E + 1
                                    else
                                        E = D[3]
                                    end
                                end
                            elseif l > 70 then
                                local E = D[2]
                                local C = e[E]
                                for D = E + 1, D[3] do
                                    i(C, e[D])
                                end
                            else
                                local c
                                local l
                                local G
                                local f
                                e[D[2]] = e[D[3]]
                                E = E + 1
                                D = C[E]
                                e[D[2]] = {}
                                E = E + 1
                                D = C[E]
                                e[D[2]] = e[D[3]]
                                E = E + 1
                                D = C[E]
                                e[D[2]] = D[3]
                                E = E + 1
                                D = C[E]
                                e[D[2]] = d[D[3]]
                                E = E + 1
                                D = C[E]
                                e[D[2]] = e[D[3]][D[4]]
                                E = E + 1
                                D = C[E]
                                e[D[2]] = D[3]
                                E = E + 1
                                D = C[E]
                                f = D[3]
                                G = e[f]
                                for D = f + 1, D[4] do
                                    G = G .. e[D]
                                end
                                e[D[2]] = G
                                E = E + 1
                                D = C[E]
                                e[D[2]][D[3]] = e[D[4]]
                                E = E + 1
                                D = C[E]
                                e[D[2]] = {}
                                E = E + 1
                                D = C[E]
                                e[D[2]] = {}
                                E = E + 1
                                D = C[E]
                                e[D[2]][D[3]] = D[4]
                                E = E + 1
                                D = C[E]
                                e[D[2]][D[3]] = D[4]
                                E = E + 1
                                D = C[E]
                                e[D[2]] = {}
                                E = E + 1
                                D = C[E]
                                e[D[2]] = {}
                                E = E + 1
                                D = C[E]
                                e[D[2]][D[3]] = D[4]
                                E = E + 1
                                D = C[E]
                                e[D[2]] = Y[D[3]]
                                E = E + 1
                                D = C[E]
                                e[D[2]] = e[D[3]][D[4]]
                                E = E + 1
                                D = C[E]
                                e[D[2]][D[3]] = e[D[4]]
                                E = E + 1
                                D = C[E]
                                e[D[2]][D[3]] = D[4]
                                E = E + 1
                                D = C[E]
                                e[D[2]] = {}
                                E = E + 1
                                D = C[E]
                                e[D[2]][D[3]] = D[4]
                                E = E + 1
                                D = C[E]
                                e[D[2]] = D[3]
                                E = E + 1
                                D = C[E]
                                e[D[2]] = d[D[3]]
                                E = E + 1
                                D = C[E]
                                e[D[2]] = e[D[3]][D[4]]
                                E = E + 1
                                D = C[E]
                                f = D[3]
                                G = e[f]
                                for D = f + 1, D[4] do
                                    G = G .. e[D]
                                end
                                e[D[2]] = G
                                E = E + 1
                                D = C[E]
                                e[D[2]][D[3]] = e[D[4]]
                                E = E + 1
                                D = C[E]
                                e[D[2]] = {}
                                E = E + 1
                                D = C[E]
                                e[D[2]][D[3]] = D[4]
                                E = E + 1
                                D = C[E]
                                e[D[2]][D[3]] = e[D[4]]
                                E = E + 1
                                D = C[E]
                                e[D[2]] = {}
                                E = E + 1
                                D = C[E]
                                e[D[2]][D[3]] = D[4]
                                E = E + 1
                                D = C[E]
                                e[D[2]] = D[3]
                                E = E + 1
                                D = C[E]
                                l = D[2]
                                f = e[D[3]]
                                e[l + 1] = f
                                e[l] = f[D[4]]
                                E = E + 1
                                D = C[E]
                                e[D[2]] = Y[D[3]]
                                E = E + 1
                                D = C[E]
                                e[D[2]] = e[D[3]]
                                E = E + 1
                                D = C[E]
                                l = D[2]
                                e[l] = e[l](e[l + 1])
                                E = E + 1
                                D = C[E]
                                e[D[2]] = e[D[3]]
                                E = E + 1
                                D = C[E]
                                l = D[2]
                                e[l] = e[l](n(e, l + 1, D[3]))
                                E = E + 1
                                D = C[E]
                                e[D[2]][D[3]] = e[D[4]]
                                E = E + 1
                                D = C[E]
                                l = D[2]
                                c = e[l]
                                for D = l + 1, D[3] do
                                    i(c, e[D])
                                end
                            end
                        elseif l <= 75 then
                            if l <= 73 then
                                if l > 72 then
                                    e[D[2]] = Y[D[3]]
                                    E = E + 1
                                    D = C[E]
                                    e[D[2]] = e[D[3]][D[4]]
                                    E = E + 1
                                    D = C[E]
                                    e[D[2]][D[3]] = e[D[4]]
                                    E = E + 1
                                    D = C[E]
                                    e[D[2]] = e[D[3]][D[4]]
                                    E = E + 1
                                    D = C[E]
                                    if e[D[2]] then
                                        E = E + 1
                                    else
                                        E = D[3]
                                    end
                                else
                                    local C = D[2]
                                    local E = e[D[3]]
                                    e[C + 1] = E
                                    e[C] = E[D[4]]
                                end
                            elseif l > 74 then
                                if e[D[2]] then
                                    E = E + 1
                                else
                                    E = D[3]
                                end
                            else
                                local f
                                local l
                                e[D[2]] = d[D[3]]
                                E = E + 1
                                D = C[E]
                                e[D[2]] = e[D[3]][D[4]]
                                E = E + 1
                                D = C[E]
                                e[D[2]] = e[D[3]]
                                E = E + 1
                                D = C[E]
                                e[D[2]] = {}
                                E = E + 1
                                D = C[E]
                                e[D[2]][D[3]] = e[D[4]]
                                E = E + 1
                                D = C[E]
                                l = D[2]
                                f = e[D[3]]
                                e[l + 1] = f
                                e[l] = f[D[4]]
                                E = E + 1
                                D = C[E]
                                e[D[2]] = D[3]
                                E = E + 1
                                D = C[E]
                                l = D[2]
                                e[l] = e[l](n(e, l + 1, D[3]))
                                E = E + 1
                                D = C[E]
                                e[D[2]][D[3]] = e[D[4]]
                                E = E + 1
                                D = C[E]
                                e[D[2]][D[3]] = e[D[4]]
                                E = E + 1
                                D = C[E]
                                e[D[2]] = Y[D[3]]
                                E = E + 1
                                D = C[E]
                                e[D[2]] = e[D[3]]
                                E = E + 1
                                D = C[E]
                                l = D[2]
                                e[l] = e[l](e[l + 1])
                                E = E + 1
                                D = C[E]
                                e[D[2]][D[3]] = e[D[4]]
                                E = E + 1
                                D = C[E]
                                l = D[2]
                                e[l](n(e, l + 1, D[3]))
                            end
                        elseif l <= 77 then
                            if l > 76 then
                                if (e[D[2]] <= e[D[4]]) then
                                    E = E + 1
                                else
                                    E = D[3]
                                end
                            else
                                if (e[D[2]] < e[D[4]]) then
                                    E = E + 1
                                else
                                    E = D[3]
                                end
                            end
                        elseif l > 78 then
                            local C = D[2]
                            local E = e[D[3]]
                            e[C + 1] = E
                            e[C] = E[D[4]]
                        else
                            e[D[2]] = e[D[3]][D[4]]
                        end
                    elseif l <= 87 then
                        if l <= 83 then
                            if l <= 81 then
                                if l == 80 then
                                    local E = D[2]
                                    local C, D = c(e[E](n(e, E + 1, D[3])))
                                    f = D + E - 1
                                    local D = 0
                                    for E = E, f do
                                        D = D + 1
                                        e[E] = C[D]
                                    end
                                else
                                    e[D[2]] = {}
                                end
                            elseif l == 82 then
                                e[D[2]] = e[D[3]] * e[D[4]]
                            else
                                e[D[2]][D[3]] = e[D[4]]
                            end
                        elseif l <= 85 then
                            if l == 84 then
                                if (e[D[2]] ~= e[D[4]]) then
                                    E = E + 1
                                else
                                    E = D[3]
                                end
                            else
                                e[D[2]] = #e[D[3]]
                            end
                        elseif l > 86 then
                            e[D[2]] = e[D[3]] + e[D[4]]
                        else
                            local f = I[D[3]]
                            local n
                            local l = {}
                            n =
                                h(
                                {},
                                {__index = function(E, D)
                                        local D = l[D]
                                        return D[1][D[2]]
                                    end, __newindex = function(e, D, E)
                                        local D = l[D]
                                        D[1][D[2]] = E
                                    end}
                            )
                            for n = 1, D[4] do
                                E = E + 1
                                local D = C[E]
                                if D[1] == 33 then
                                    l[n - 1] = {e, D[3]}
                                else
                                    l[n - 1] = {Y, D[3]}
                                end
                                o[#o + 1] = l
                            end
                            e[D[2]] = a(f, n, d)
                        end
                    elseif l <= 91 then
                        if l <= 89 then
                            if l == 88 then
                                local l
                                e[D[2]] = e[D[3]][D[4]]
                                E = E + 1
                                D = C[E]
                                e[D[2]] = e[D[3]]
                                E = E + 1
                                D = C[E]
                                e[D[2]] = e[D[3]][D[4]]
                                E = E + 1
                                D = C[E]
                                l = D[2]
                                e[l] = e[l](n(e, l + 1, D[3]))
                                E = E + 1
                                D = C[E]
                                if e[D[2]] then
                                    E = E + 1
                                else
                                    E = D[3]
                                end
                            else
                                local n = D[2]
                                local l = {}
                                for D = 1, #o do
                                    local D = o[D]
                                    for E = 0, #D do
                                        local E = D[E]
                                        local C = E[1]
                                        local D = E[2]
                                        if C == e and D >= n then
                                            l[D] = C[D]
                                            E[1] = l
                                        end
                                    end
                                end
                            end
                        elseif l == 90 then
                            local G
                            local a, i
                            local o
                            local l
                            e[D[2]] = e[D[3]][D[4]]
                            E = E + 1
                            D = C[E]
                            e[D[2]] = Y[D[3]]
                            E = E + 1
                            D = C[E]
                            e[D[2]] = e[D[3]][D[4]]
                            E = E + 1
                            D = C[E]
                            e[D[2]] = e[D[3]][D[4]]
                            E = E + 1
                            D = C[E]
                            e[D[2]] = e[D[3]][D[4]]
                            E = E + 1
                            D = C[E]
                            e[D[2]] = e[D[3]][D[4]]
                            E = E + 1
                            D = C[E]
                            e[D[2]] = e[D[3]][D[4]]
                            E = E + 1
                            D = C[E]
                            l = D[2]
                            e[l] = e[l](n(e, l + 1, D[3]))
                            E = E + 1
                            D = C[E]
                            e[D[2]] = d[D[3]]
                            E = E + 1
                            D = C[E]
                            e[D[2]] = e[D[3]][D[4]]
                            E = E + 1
                            D = C[E]
                            e[D[2]] = D[3]
                            E = E + 1
                            D = C[E]
                            e[D[2]] = D[3]
                            E = E + 1
                            D = C[E]
                            e[D[2]] = e[D[3]]
                            E = E + 1
                            D = C[E]
                            l = D[2]
                            e[l] = e[l](n(e, l + 1, D[3]))
                            E = E + 1
                            D = C[E]
                            e[D[2]] = d[D[3]]
                            E = E + 1
                            D = C[E]
                            e[D[2]] = e[D[3]][D[4]]
                            E = E + 1
                            D = C[E]
                            e[D[2]] = D[3]
                            E = E + 1
                            D = C[E]
                            e[D[2]] = D[3]
                            E = E + 1
                            D = C[E]
                            e[D[2]] = Y[D[3]]
                            E = E + 1
                            D = C[E]
                            l = D[2]
                            o = e[D[3]]
                            e[l + 1] = o
                            e[l] = o[D[4]]
                            E = E + 1
                            D = C[E]
                            e[D[2]] = e[D[3]][D[4]]
                            E = E + 1
                            D = C[E]
                            e[D[2]] = e[D[3]][D[4]]
                            E = E + 1
                            D = C[E]
                            l = D[2]
                            a, i = c(e[l](n(e, l + 1, D[3])))
                            f = i + l - 1
                            G = 0
                            for D = l, f do
                                G = G + 1
                                e[D] = a[G]
                            end
                            E = E + 1
                            D = C[E]
                            l = D[2]
                            e[l] = e[l](n(e, l + 1, f))
                            E = E + 1
                            D = C[E]
                            e[D[2]] = e[D[3]] * e[D[4]]
                            E = E + 1
                            D = C[E]
                            e[D[2]] = d[D[3]]
                            E = E + 1
                            D = C[E]
                            e[D[2]] = e[D[3]][D[4]]
                            E = E + 1
                            D = C[E]
                            e[D[2]] = Y[D[3]]
                            E = E + 1
                            D = C[E]
                            e[D[2]] = e[D[3]][D[4]]
                            E = E + 1
                            D = C[E]
                            e[D[2]] = e[D[3]][D[4]]
                            E = E + 1
                            D = C[E]
                            e[D[2]] = e[D[3]][e[D[4]]]
                            E = E + 1
                            D = C[E]
                            e[D[2]] = e[D[3]][D[4]]
                            E = E + 1
                            D = C[E]
                            e[D[2]] = e[D[3]] * e[D[4]]
                            E = E + 1
                            D = C[E]
                            l = D[2]
                            do
                                return e[l](n(e, l + 1, D[3]))
                            end
                            E = E + 1
                            D = C[E]
                            l = D[2]
                            do
                                return n(e, l, f)
                            end
                            E = E + 1
                            D = C[E]
                            do
                                return
                            end
                        else
                            if (D[2] <= e[D[4]]) then
                                E = D[3]
                            else
                                E = E + 1
                            end
                        end
                    elseif l <= 93 then
                        if l == 92 then
                            e[D[2]] = a(I[D[3]], nil, d)
                        else
                            do
                                return e[D[2]]
                            end
                        end
                    elseif l > 94 then
                        local l, l
                        local G
                        local o, a
                        local i
                        local l
                        e[D[2]] = {}
                        E = E + 1
                        D = C[E]
                        e[D[2]] = D[3]
                        E = E + 1
                        D = C[E]
                        e[D[2]] = d[D[3]]
                        E = E + 1
                        D = C[E]
                        e[D[2]] = Y[D[3]]
                        E = E + 1
                        D = C[E]
                        l = D[2]
                        i = e[D[3]]
                        e[l + 1] = i
                        e[l] = i[D[4]]
                        E = E + 1
                        D = C[E]
                        l = D[2]
                        o, a = c(e[l](e[l + 1]))
                        f = a + l - 1
                        G = 0
                        for D = l, f do
                            G = G + 1
                            e[D] = o[G]
                        end
                        E = E + 1
                        D = C[E]
                        l = D[2]
                        o, G = {e[l](n(e, l + 1, f))}, 0
                        for D = l, D[4] do
                            G = G + 1
                            e[D] = o[G]
                        end
                        E = E + 1
                        D = C[E]
                        E = D[3]
                    else
                        if (e[D[2]] < e[D[4]]) then
                            E = D[3]
                        else
                            E = E + 1
                        end
                    end
                elseif l <= 111 then
                    if l <= 103 then
                        if l <= 99 then
                            if l <= 97 then
                                if l > 96 then
                                    e[D[2]][D[3]] = D[4]
                                else
                                    local D = D[2]
                                    e[D](e[D + 1])
                                end
                            elseif l > 98 then
                                local n
                                local l
                                e[D[2]] = {}
                                E = E + 1
                                D = C[E]
                                e[D[2]] = D[3]
                                E = E + 1
                                D = C[E]
                                e[D[2]] = D[3]
                                E = E + 1
                                D = C[E]
                                e[D[2]] = D[3]
                                E = E + 1
                                D = C[E]
                                e[D[2]] = D[3]
                                E = E + 1
                                D = C[E]
                                e[D[2]] = D[3]
                                E = E + 1
                                D = C[E]
                                l = D[2]
                                n = e[l]
                                for D = l + 1, D[3] do
                                    i(n, e[D])
                                end
                            else
                                local E = D[2]
                                e[E] = e[E](n(e, E + 1, D[3]))
                            end
                        elseif l <= 101 then
                            if l > 100 then
                                if (D[2] < e[D[4]]) then
                                    E = D[3]
                                else
                                    E = E + 1
                                end
                            else
                                local E = D[2]
                                do
                                    return e[E](n(e, E + 1, D[3]))
                                end
                            end
                        elseif l == 102 then
                            local E = D[2]
                            local C = e[E]
                            for D = E + 1, D[3] do
                                i(C, e[D])
                            end
                        else
                            e[D[2]] = e[D[3]] / D[4]
                        end
                    elseif l <= 107 then
                        if l <= 105 then
                            if l > 104 then
                                local f
                                local l
                                l = D[2]
                                f = e[D[3]]
                                e[l + 1] = f
                                e[l] = f[D[4]]
                                E = E + 1
                                D = C[E]
                                e[D[2]] = e[D[3]]
                                E = E + 1
                                D = C[E]
                                e[D[2]] = e[D[3]][e[D[4]]]
                                E = E + 1
                                D = C[E]
                                l = D[2]
                                e[l] = e[l](n(e, l + 1, D[3]))
                                E = E + 1
                                D = C[E]
                                if not e[D[2]] then
                                    E = E + 1
                                else
                                    E = D[3]
                                end
                            else
                                if (e[D[2]] < e[D[4]]) then
                                    E = E + 1
                                else
                                    E = D[3]
                                end
                            end
                        elseif l == 106 then
                            e[D[2]] = e[D[3]][e[D[4]]]
                        else
                            if e[D[2]] then
                                E = E + 1
                            else
                                E = D[3]
                            end
                        end
                    elseif l <= 109 then
                        if l == 108 then
                            local f
                            local G
                            local l
                            e[D[2]] = D[3]
                            E = E + 1
                            D = C[E]
                            e[D[2]] = D[3]
                            E = E + 1
                            D = C[E]
                            l = D[2]
                            e[l] = e[l](n(e, l + 1, D[3]))
                            E = E + 1
                            D = C[E]
                            e[D[2]] = D[3]
                            E = E + 1
                            D = C[E]
                            G = D[3]
                            f = e[G]
                            for D = G + 1, D[4] do
                                f = f .. e[D]
                            end
                            e[D[2]] = f
                        else
                            if (D[2] < e[D[4]]) then
                                E = E + 1
                            else
                                E = D[3]
                            end
                        end
                    elseif l == 110 then
                        local G
                        local o, d
                        local l
                        l = D[2]
                        e[l](n(e, l + 1, D[3]))
                        E = E + 1
                        D = C[E]
                        e[D[2]] = e[D[3]]
                        E = E + 1
                        D = C[E]
                        e[D[2]] = e[D[3]]
                        E = E + 1
                        D = C[E]
                        e[D[2]] = Y[D[3]]
                        E = E + 1
                        D = C[E]
                        e[D[2]] = e[D[3]]
                        E = E + 1
                        D = C[E]
                        l = D[2]
                        o, d = c(e[l](e[l + 1]))
                        f = d + l - 1
                        G = 0
                        for D = l, f do
                            G = G + 1
                            e[D] = o[G]
                        end
                        E = E + 1
                        D = C[E]
                        l = D[2]
                        do
                            return n(e, l, f)
                        end
                        E = E + 1
                        D = C[E]
                        do
                            return
                        end
                    else
                        e[D[2]] = Y[D[3]]
                    end
                elseif l <= 119 then
                    if l <= 115 then
                        if l <= 113 then
                            if l > 112 then
                                e[D[2]] = #e[D[3]]
                            else
                                local l
                                local G
                                local f
                                e[D[2]] = D[3]
                                E = E + 1
                                D = C[E]
                                e[D[2]] = D[3]
                                E = E + 1
                                D = C[E]
                                f = D[2]
                                e[f] = e[f](n(e, f + 1, D[3]))
                                E = E + 1
                                D = C[E]
                                e[D[2]] = D[3]
                                E = E + 1
                                D = C[E]
                                G = D[3]
                                l = e[G]
                                for D = G + 1, D[4] do
                                    l = l .. e[D]
                                end
                                e[D[2]] = l
                            end
                        elseif l == 114 then
                            local G = I[D[3]]
                            local f
                            local l = {}
                            f =
                                h(
                                {},
                                {__index = function(E, D)
                                        local D = l[D]
                                        return D[1][D[2]]
                                    end, __newindex = function(e, D, E)
                                        local D = l[D]
                                        D[1][D[2]] = E
                                    end}
                            )
                            for n = 1, D[4] do
                                E = E + 1
                                local D = C[E]
                                if D[1] == 33 then
                                    l[n - 1] = {e, D[3]}
                                else
                                    l[n - 1] = {Y, D[3]}
                                end
                                o[#o + 1] = l
                            end
                            e[D[2]] = a(G, f, d)
                        else
                            local Y
                            local o, i
                            local G
                            local l
                            e[D[2]] = {}
                            E = E + 1
                            D = C[E]
                            e[D[2]] = d[D[3]]
                            E = E + 1
                            D = C[E]
                            l = D[2]
                            G = e[D[3]]
                            e[l + 1] = G
                            e[l] = G[D[4]]
                            E = E + 1
                            D = C[E]
                            e[D[2]] = D[3]
                            E = E + 1
                            D = C[E]
                            l = D[2]
                            e[l] = e[l](n(e, l + 1, D[3]))
                            E = E + 1
                            D = C[E]
                            e[D[2]] = d[D[3]]
                            E = E + 1
                            D = C[E]
                            l = D[2]
                            G = e[D[3]]
                            e[l + 1] = G
                            e[l] = G[D[4]]
                            E = E + 1
                            D = C[E]
                            e[D[2]] = D[3]
                            E = E + 1
                            D = C[E]
                            l = D[2]
                            e[l] = e[l](n(e, l + 1, D[3]))
                            E = E + 1
                            D = C[E]
                            e[D[2]] = d[D[3]]
                            E = E + 1
                            D = C[E]
                            l = D[2]
                            G = e[D[3]]
                            e[l + 1] = G
                            e[l] = G[D[4]]
                            E = E + 1
                            D = C[E]
                            e[D[2]] = D[3]
                            E = E + 1
                            D = C[E]
                            l = D[2]
                            e[l] = e[l](n(e, l + 1, D[3]))
                            E = E + 1
                            D = C[E]
                            e[D[2]] = e[D[3]][D[4]]
                            E = E + 1
                            D = C[E]
                            l = D[2]
                            G = e[D[3]]
                            e[l + 1] = G
                            e[l] = G[D[4]]
                            E = E + 1
                            D = C[E]
                            e[D[2]] = D[3]
                            E = E + 1
                            D = C[E]
                            l = D[2]
                            e[l] = e[l](n(e, l + 1, D[3]))
                            E = E + 1
                            D = C[E]
                            l = D[2]
                            G = e[D[3]]
                            e[l + 1] = G
                            e[l] = G[D[4]]
                            E = E + 1
                            D = C[E]
                            e[D[2]] = D[3]
                            E = E + 1
                            D = C[E]
                            l = D[2]
                            e[l] = e[l](n(e, l + 1, D[3]))
                            E = E + 1
                            D = C[E]
                            e[D[2]] = d[D[3]]
                            E = E + 1
                            D = C[E]
                            l = D[2]
                            G = e[D[3]]
                            e[l + 1] = G
                            e[l] = G[D[4]]
                            E = E + 1
                            D = C[E]
                            e[D[2]] = D[3]
                            E = E + 1
                            D = C[E]
                            l = D[2]
                            o, i = c(e[l](n(e, l + 1, D[3])))
                            f = i + l - 1
                            Y = 0
                            for D = l, f do
                                Y = Y + 1
                                e[D] = o[Y]
                            end
                            E = E + 1
                            D = C[E]
                            l = D[2]
                            e[l] = e[l](n(e, l + 1, f))
                            E = E + 1
                            D = C[E]
                            e[D[2]] = d[D[3]]
                            E = E + 1
                            D = C[E]
                            l = D[2]
                            G = e[D[3]]
                            e[l + 1] = G
                            e[l] = G[D[4]]
                            E = E + 1
                            D = C[E]
                            e[D[2]] = D[3]
                            E = E + 1
                            D = C[E]
                            l = D[2]
                            e[l] = e[l](n(e, l + 1, D[3]))
                            E = E + 1
                            D = C[E]
                            l = D[2]
                            G = e[D[3]]
                            e[l + 1] = G
                            e[l] = G[D[4]]
                            E = E + 1
                            D = C[E]
                            e[D[2]] = D[3]
                            E = E + 1
                            D = C[E]
                            l = D[2]
                            o, i = c(e[l](n(e, l + 1, D[3])))
                            f = i + l - 1
                            Y = 0
                            for D = l, f do
                                Y = Y + 1
                                e[D] = o[Y]
                            end
                            E = E + 1
                            D = C[E]
                            l = D[2]
                            e[l] = e[l](n(e, l + 1, f))
                            E = E + 1
                            D = C[E]
                            e[D[2]] = d[D[3]]
                            E = E + 1
                            D = C[E]
                            l = D[2]
                            G = e[D[3]]
                            e[l + 1] = G
                            e[l] = G[D[4]]
                            E = E + 1
                            D = C[E]
                            e[D[2]] = D[3]
                            E = E + 1
                            D = C[E]
                            l = D[2]
                            e[l] = e[l](n(e, l + 1, D[3]))
                            E = E + 1
                            D = C[E]
                            l = D[2]
                            G = e[D[3]]
                            e[l + 1] = G
                            e[l] = G[D[4]]
                            E = E + 1
                            D = C[E]
                            e[D[2]] = D[3]
                            E = E + 1
                            D = C[E]
                            l = D[2]
                            o, i = c(e[l](n(e, l + 1, D[3])))
                            f = i + l - 1
                            Y = 0
                            for D = l, f do
                                Y = Y + 1
                                e[D] = o[Y]
                            end
                            E = E + 1
                            D = C[E]
                            l = D[2]
                            e[l] = e[l](n(e, l + 1, f))
                            E = E + 1
                            D = C[E]
                            e[D[2]] = d[D[3]]
                            E = E + 1
                            D = C[E]
                            l = D[2]
                            G = e[D[3]]
                            e[l + 1] = G
                            e[l] = G[D[4]]
                            E = E + 1
                            D = C[E]
                            e[D[2]] = D[3]
                            E = E + 1
                            D = C[E]
                            l = D[2]
                            o, i = c(e[l](n(e, l + 1, D[3])))
                            f = i + l - 1
                            Y = 0
                            for D = l, f do
                                Y = Y + 1
                                e[D] = o[Y]
                            end
                            E = E + 1
                            D = C[E]
                            l = D[2]
                            e[l] = e[l](n(e, l + 1, f))
                            E = E + 1
                            D = C[E]
                            e[D[2]] = d[D[3]]
                            E = E + 1
                            D = C[E]
                            l = D[2]
                            G = e[D[3]]
                            e[l + 1] = G
                            e[l] = G[D[4]]
                            E = E + 1
                            D = C[E]
                            e[D[2]] = D[3]
                            E = E + 1
                            D = C[E]
                            l = D[2]
                            o, i = c(e[l](n(e, l + 1, D[3])))
                            f = i + l - 1
                            Y = 0
                            for D = l, f do
                                Y = Y + 1
                                e[D] = o[Y]
                            end
                            E = E + 1
                            D = C[E]
                            l = D[2]
                            e[l] = e[l](n(e, l + 1, f))
                            E = E + 1
                            D = C[E]
                            e[D[2]] = {}
                            E = E + 1
                            D = C[E]
                            e[D[2]][D[3]] = D[4]
                            E = E + 1
                            D = C[E]
                            e[D[2]][D[3]] = D[4]
                            E = E + 1
                            D = C[E]
                            e[D[2]][D[3]] = D[4]
                            E = E + 1
                            D = C[E]
                            e[D[2]][D[3]] = D[4]
                            E = E + 1
                            D = C[E]
                            e[D[2]] = {}
                            E = E + 1
                            D = C[E]
                            e[D[2]][D[3]] = D[4]
                            E = E + 1
                            D = C[E]
                            e[D[2]][D[3]] = D[4]
                            E = E + 1
                            D = C[E]
                            e[D[2]][D[3]] = D[4]
                            E = E + 1
                            D = C[E]
                            e[D[2]][D[3]] = D[4]
                            E = E + 1
                            D = C[E]
                            e[D[2]][D[3]] = D[4]
                            E = E + 1
                            D = C[E]
                            e[D[2]][D[3]] = D[4]
                            E = E + 1
                            D = C[E]
                            e[D[2]][D[3]] = D[4]
                            E = E + 1
                            D = C[E]
                            e[D[2]][D[3]] = D[4]
                            E = E + 1
                            D = C[E]
                            e[D[2]][D[3]] = D[4]
                        end
                    elseif l <= 117 then
                        if l == 116 then
                            e[D[2]] = d[D[3]]
                        else
                            E = D[3]
                        end
                    elseif l > 118 then
                        e[D[2]] = e[D[3]][D[4]]
                    else
                        local f, n
                        local l
                        e[D[2]] = D[3]
                        E = E + 1
                        D = C[E]
                        e[D[2]] = d[D[3]]
                        E = E + 1
                        D = C[E]
                        e[D[2]] = e[D[3]]
                        E = E + 1
                        D = C[E]
                        l = D[2]
                        f, n = {e[l](e[l + 1])}, 0
                        for D = l, D[4] do
                            n = n + 1
                            e[D] = f[n]
                        end
                        E = E + 1
                        D = C[E]
                        E = D[3]
                    end
                elseif l <= 123 then
                    if l <= 121 then
                        if l > 120 then
                            local E = D[2]
                            e[E] = e[E](n(e, E + 1, D[3]))
                        else
                            local C = D[2]
                            local l, E = {e[C](n(e, C + 1, f))}, 0
                            for D = C, D[4] do
                                E = E + 1
                                e[D] = l[E]
                            end
                        end
                    elseif l > 122 then
                        local l
                        e[D[2]] = e[D[3]]
                        E = E + 1
                        D = C[E]
                        l = D[2]
                        e[l] = e[l](e[l + 1])
                        E = E + 1
                        D = C[E]
                        e[D[2]] = e[D[3]] + e[D[4]]
                        E = E + 1
                        D = C[E]
                        e[D[2]] = d[D[3]]
                        E = E + 1
                        D = C[E]
                        e[D[2]] = e[D[3]][D[4]]
                        E = E + 1
                        D = C[E]
                        e[D[2]] = e[D[3]]
                        E = E + 1
                        D = C[E]
                        e[D[2]] = {}
                        E = E + 1
                        D = C[E]
                        e[D[2]][D[3]] = e[D[4]]
                        E = E + 1
                        D = C[E]
                        e[D[2]] = e[D[3]][D[4]]
                        E = E + 1
                        D = C[E]
                        e[D[2]][D[3]] = e[D[4]]
                        E = E + 1
                        D = C[E]
                        e[D[2]][D[3]] = e[D[4]]
                        E = E + 1
                        D = C[E]
                        e[D[2]] = Y[D[3]]
                        E = E + 1
                        D = C[E]
                        e[D[2]] = e[D[3]]
                        E = E + 1
                        D = C[E]
                        l = D[2]
                        e[l] = e[l](e[l + 1])
                        E = E + 1
                        D = C[E]
                        e[D[2]][D[3]] = e[D[4]]
                        E = E + 1
                        D = C[E]
                        e[D[2]][D[3]] = D[4]
                        E = E + 1
                        D = C[E]
                        l = D[2]
                        e[l](n(e, l + 1, D[3]))
                        E = E + 1
                        D = C[E]
                        E = D[3]
                    else
                        e[D[2]] = {}
                    end
                elseif l <= 125 then
                    if l == 124 then
                        local f, l
                        local n
                        e[D[2]] = D[3]
                        E = E + 1
                        D = C[E]
                        e[D[2]] = d[D[3]]
                        E = E + 1
                        D = C[E]
                        e[D[2]] = e[D[3]]
                        E = E + 1
                        D = C[E]
                        n = D[2]
                        f, l = {e[n](e[n + 1])}, 0
                        for D = n, D[4] do
                            l = l + 1
                            e[D] = f[l]
                        end
                        E = E + 1
                        D = C[E]
                        E = D[3]
                    else
                        if (D[2] <= e[D[4]]) then
                            E = D[3]
                        else
                            E = E + 1
                        end
                    end
                elseif l == 126 then
                    e[D[2]] = a(I[D[3]], nil, d)
                else
                    if not e[D[2]] then
                        E = E + 1
                    else
                        E = D[3]
                    end
                end
                E = E + 1
            end
        end
    end
    return a(H(), {}, K)(...)
end)(...)
