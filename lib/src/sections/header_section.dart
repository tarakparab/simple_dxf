part of 'sections.dart';

/// Contains general drawing information and settings.
class HeaderSection extends Section<Variable> {
  HeaderSection({
    required ACADVER acadver,
    // required ANGBASE angbase,
    // required ANGDIR angdir,
    // required ATTDIA attdia,
    // required ATTMODE attmode,
    // required ATTREQ attreq,
    // required AUNITS aunits,
    // required AUPREC auprec,
    // required BLIPMODE blipmode,
    // required CECOLOR cecolor,
    // required CELTYPE celtype,
    // required CHAMFERA chamfera,
    // required CHAMFERB chamferb,
    // required CLAYER clayer,
    // required COORDS coords,
    // required DIMALT dimalt,
    // required DIMALTD dimaltd,
    // required DIMALTF dimaltf,
    // required DIMASO dimaso,
    // required DIMASZ dimasz,
    // required DIMBLK dimblk,
    // required DIMBLK1 dimblk1,
    // required DIMBLK2 dimblk2,
    // required DIMCEN dimcen,
    // required DIMCLRD dimclrd,
    // required DIMCLRE dimclre,
    // required DIMCLRT dimclrt,
    // required DIMDLE dimdle,
    // required DIMDLI dimdli,
    // required DIMEXE dimexe,
    // required DIMEXO dimexo,
    // required DIMGAP dimgap,
    // required DIMLFAC dimlfac,
    // required DIMLIM dimlim,
    // required DIMPOST dimpost,
    // required DIMRND dimrnd,
    // required DIMSAH dimsah,
    // required DIMSCALE dimscale,
    // required DIMSE1 dimse1,
    // required DIMSE2 dimse2,
    // required DIMSHO dimsho,
    // required DIMSOXD dimsoxd,
    // required DIMSTYLE dimstyle,
    // required DIMTAD dimtad,
    // required DIMTFAC dimtfac,
    // required DIMTIH dimtih,
    // required DIMTIX dimtix,
    // required DIMTM dimtm,
    // required DIMTOFL dimtofl,
    // required DIMTOH dimtoh,
    // required DIMTOL dimtol,
    // required DIMTP dimtp,
    // required DIMTSZ dimtsz,
    // required DIMTVP dimtvp,
    // required DIMTXT dimtxt,
    // required DIMZIN dimzin,
    // required DRAGMODE dragmode,
    // required ELEVATION elevation,
    required EXTMAX extmax,
    required EXTMIN extmin,
    // required FILLETRAD filletrad,
    // required FILLMODE fillmode,
    // required HANDLING handling,
    // required HANDSEED handseed,
    required INSBASE insbase,
    // required INSUNITS insunits,
    // required LIMCHECK limcheck,
    // required LIMMAX limmax,
    // required LIMMIN limmin,
    // required LTSCALE ltscale,
    // required LUNITS lunits,
    // required LUPREC luprec,
    // required MAXACTVP maxactvp,
    // required MENU menu,
    // required MIRRTEXT mirrtext,
    // required OSMODE osmode,
    // required ORTHOMODE orthomode,
    // required PDMODE pdmode,
    // required PDSIZE pdsize,
    // required PELEVATION pelevation,
    // required PEXTMAX pextmax,
    // required PEXTMIN pextmin,
    // required PLIMCHECK plimcheck,
    // required PLIMMAX plimmax,
    // required PLIMMIN plimmin,
    // required PLINEGEN plinegen,
    // required PLINEWID plinewid,
    // required PSLTSCALE psltscale,
    // required PUCSNAME pucsname,
    // required PUCSORG pucsorg,
    // required PUCSXDIR pucsxdir,
    // required PUCSYDIR pucsydir,
    // required QTEXTMODE qtextmode,
    // required REGENMODE regenmode,
    // required SHADEDGE shadedge,
    // required SHADEDIF shadedif,
    // required SKETCHINC sketchinc,
    // required SKPOLY skpoly,
    // required SPLFRAME splframe,
    // required SPLINESEGS splinesegs,
    // required SPLINETYPE splinetype,
    // required SURFTAB1 surftab1,
    // required SURFTAB2 surftab2,
    // required SURFTYPE surftype,
    // required SURFU surfu,
    // required SURFV surfv,
    // required TDCREATE tdcreate,
    // required TDINDWG tdindwg,
    // required TDUPDATE tdupdate,
    // required TDUSRTIMER tdusrtimer,
    // required TEXTSIZE textsize,
    // required TEXTSTYLE textstyle,
    // required THICKNESS thickness,
    // required TILEMODE tilemode,
    // required TRACEWID tracewid,
    // required UCSNAME ucsname,
    // required UCSORG ucsorg,
    // required UCSXDIR ucsxdir,
    // required UCSYDIR ucsydir,
    // required UNITMODE unitmode,
    // required USERI1 useri1,
    // required USERI2 useri2,
    // required USERI3 useri3,
    // required USERI4 useri4,
    // required USERI5 useri5,
    // required USERR1 userr1,
    // required USERR2 userr2,
    // required USERR3 userr3,
    // required USERR4 userr4,
    // required USERR5 userr5,
    // required USRTIMER usrtimer,
    // required VISRETAIN visretain,
    // required WORLDVIEW worldview,
  }) : super(name: 'HEADER') {
    _contents.addAll({
      ACADVER: acadver,
      INSBASE: insbase,
      EXTMIN: extmin,
      EXTMAX: extmax,
      // ANGBASE: angbase,
      // ANGDIR: angdir,
      // ATTDIA: attdia,
      // ATTMODE: attmode,
      // ATTREQ: attreq,
      // AUNITS: aunits,
      // AUPREC: auprec,
      // BLIPMODE: blipmode,
      // CECOLOR: cecolor,
      // CELTYPE: celtype,
      // CHAMFERA: chamfera,
      // CHAMFERB: chamferb,
      // CLAYER: clayer,
      // COORDS: coords,
      // DIMALT: dimalt,
      // DIMALTD: dimaltd,
      // DIMALTF: dimaltf,
      // DIMASO: dimaso,
      // DIMASZ: dimasz,
      // DIMBLK: dimblk,
      // DIMBLK1: dimblk1,
      // DIMBLK2: dimblk2,
      // DIMCEN: dimcen,
      // DIMCLRD: dimclrd,
      // DIMCLRE: dimclre,
      // DIMCLRT: dimclrt,
      // DIMDLE: dimdle,
      // DIMDLI: dimdli,
      // DIMEXE: dimexe,
      // DIMEXO: dimexo,
      // DIMGAP: dimgap,
      // DIMLFAC: dimlfac,
      // DIMLIM: dimlim,
      // DIMPOST: dimpost,
      // DIMRND: dimrnd,
      // DIMSAH: dimsah,
      // DIMSCALE: dimscale,
      // DIMSE1: dimse1,
      // DIMSE2: dimse2,
      // DIMSHO: dimsho,
      // DIMSOXD: dimsoxd,
      // DIMSTYLE: dimstyle,
      // DIMTAD: dimtad,
      // DIMTFAC: dimtfac,
      // DIMTIH: dimtih,
      // DIMTIX: dimtix,
      // DIMTM: dimtm,
      // DIMTOFL: dimtofl,
      // DIMTOH: dimtoh,
      // DIMTOL: dimtol,
      // DIMTP: dimtp,
      // DIMTSZ: dimtsz,
      // DIMTVP: dimtvp,
      // DIMTXT: dimtxt,
      // DIMZIN: dimzin,
      // DRAGMODE: dragmode,
      // ELEVATION: elevation,
      // FILLETRAD: filletrad,
      // FILLMODE: fillmode,
      // HANDLING: handling,
      // HANDSEED: handseed,
      // INSUNITS: insunits,
      // LIMCHECK: limcheck,
      // LIMMAX: limmax,
      // LIMMIN: limmin,
      // LTSCALE: ltscale,
      // LUNITS: lunits,
      // LUPREC: luprec,
      // MAXACTVP: maxactvp,
      // MENU: menu,
      // MIRRTEXT: mirrtext,
      // OSMODE: osmode,
      // ORTHOMODE: orthomode,
      // PDMODE: pdmode,
      // PDSIZE: pdsize,
      // PELEVATION: pelevation,
      // PEXTMAX: pextmax,
      // PEXTMIN: pextmin,
      // PLIMCHECK: plimcheck,
      // PLIMMAX: plimmax,
      // PLIMMIN: plimmin,
      // PLINEGEN: plinegen,
      // PLINEWID: plinewid,
      // PSLTSCALE: psltscale,
      // PUCSNAME: pucsname,
      // PUCSORG: pucsorg,
      // PUCSXDIR: pucsxdir,
      // PUCSYDIR: pucsydir,
      // QTEXTMODE: qtextmode,
      // REGENMODE: regenmode,
      // SHADEDGE: shadedge,
      // SHADEDIF: shadedif,
      // SKETCHINC: sketchinc,
      // SKPOLY: skpoly,
      // SPLFRAME: splframe,
      // SPLINESEGS: splinesegs,
      // SPLINETYPE: splinetype,
      // SURFTAB1: surftab1,
      // SURFTAB2: surftab2,
      // SURFTYPE: surftype,
      // SURFU: surfu,
      // SURFV: surfv,
      // TDCREATE: tdcreate,
      // TDINDWG: tdindwg,
      // TDUPDATE: tdupdate,
      // TDUSRTIMER: tdusrtimer,
      // TEXTSIZE: textsize,
      // TEXTSTYLE: textstyle,
      // THICKNESS: thickness,
      // TILEMODE: tilemode,
      // TRACEWID: tracewid,
      // UCSNAME: ucsname,
      // UCSORG: ucsorg,
      // UCSXDIR: ucsxdir,
      // UCSYDIR: ucsydir,
      // UNITMODE: unitmode,
      // USERI1: useri1,
      // USERI2: useri2,
      // USERI3: useri3,
      // USERI4: useri4,
      // USERI5: useri5,
      // USERR1: userr1,
      // USERR2: userr2,
      // USERR3: userr3,
      // USERR4: userr4,
      // USERR5: userr5,
      // USRTIMER: usrtimer,
      // VISRETAIN: visretain,
      // WORLDVIEW: worldview,
    });
  }

  static get defaultHeaderR12 => HeaderSection(
        acadver: ACADVER.r11_12,
        // angbase: ANGBASE(0),
        // angdir: ANGDIR.clockwise,
        // attdia: ATTDIA.useDialogBox,
        // attmode: ATTMODE.normal,
        // attreq: ATTREQ.promptForAttributeValues,
        // aunits: AUNITS.decimalDegrees,
        // auprec: AUPREC(0),
        // blipmode: BLIPMODE.off,
        // cecolor: CECOLOR.byLayer,
        // celtype: CELTYPE(LineType.byLayer),
        // chamfera: CHAMFERA(0),
        // chamferb: CHAMFERB(0),
        // clayer: CLAYER(Layer.zero),
        // coords: COORDS.absCoordsRealtime,
        // dimalt: DIMALT.disableAlternatUnits,
        // dimaltd: DIMALTD(2),
        // dimaltf: DIMALTF(25),
        // dimaso: DIMASO.drawIndividualEntities,
        // dimasz: DIMASZ(0.18),
        // dimblk: DIMBLK.defaultValue,
        // dimblk1: DIMBLK1.defaultValue,
        // dimblk2: DIMBLK2.defaultValue,
        // dimcen: DIMCEN(0.09),
        // dimclrd: DIMCLRD.byBlock,
        // dimclre: DIMCLRE.byBlock,
        // dimclrt: DIMCLRT.byBlock,
        // dimdle: DIMDLE(0),
        // dimdli: DIMDLI(0.38),
        // dimexe: DIMEXE(0.18),
        // dimexo: DIMEXO(0.0625),
        // dimgap: DIMGAP(0.09),
        // dimlfac: DIMLFAC(1.0),
        // dimlim: DIMLIM(0),
        // dimpost: DIMPOST.defaultValue,
        // dimrnd: DIMRND(0),
        // dimsah: DIMSAH(0),
        // dimscale: DIMSCALE(1.0),
        // dimse1: DIMSE1(0),
        // dimse2: DIMSE2(0),
        // dimsho: DIMSHO.recomputeDimensionsWhileDragging,
        // dimsoxd: DIMSOXD(0),
        // dimstyle:
        //     DIMSTYLE('STANDARD'), // FIXME create and pass dimstyle table entry
        // dimtad: DIMTAD(0),
        // dimtfac: DIMTFAC(1.0),
        // dimtih: DIMTIH(1),
        // dimtix: DIMTIX(0),
        // dimtm: DIMTM(0),
        // dimtofl: DIMTOFL(0),
        // dimtoh: DIMTOH(1),
        // dimtol: DIMTOL(0),
        // dimtp: DIMTP(0),
        // dimtsz: DIMTSZ(0),
        // dimtvp: DIMTVP(0),
        // dimtxt: DIMTXT(0.18),
        // dimzin: DIMZIN.include0Ftand0In,
        // dragmode: DRAGMODE.displayOutlineIfCommand,
        // elevation: ELEVATION(0),
        extmax: EXTMAX(0, 0, 0),
        extmin: EXTMIN(0, 0, 0),
        // filletrad: FILLETRAD(0),
        // fillmode: FILLMODE(1),
        // handling: HANDLING(1),
        // handseed: HANDSEED('20000'),
        insbase: INSBASE(0, 0, 0),
        // insunits: INSUNITS.millimeters,
        // limcheck: LIMCHECK(0),
        // limmax: LIMMAX(12, 9), //FIXME check docs
        // limmin: LIMMIN(0, 0),
        // ltscale: LTSCALE(1),
        // lunits: LUNITS.decimal,
        // luprec: LUPREC(4), //FIXME check docs
        // maxactvp: MAXACTVP(64), //FIXME check docs
        // menu: MENU('.'),
        // mirrtext: MIRRTEXT(0),
        // osmode: OSMODE([
        //   OSMODES.endpoint,
        //   OSMODES.midpoint,
        //   OSMODES.center,
        //   OSMODES.node,
        //   OSMODES.quadrant,
        //   OSMODES.intersection,
        //   OSMODES.insertion,
        //   OSMODES.perpendicular,
        //   OSMODES.tangent,
        //   OSMODES.geometricCenter,
        //   OSMODES.apparentIntersection,
        //   OSMODES.entension,
        // ]),
        // orthomode: ORTHOMODE(0),
        // pdmode: PDMODE(0),
        // pdsize: PDSIZE(0),
        // pelevation: PELEVATION(0),
        // pextmax: PEXTMAX(0, 0, 0),
        // pextmin: PEXTMIN(0, 0, 0),
        // plimcheck: PLIMCHECK(0),
        // plimmax: PLIMMAX(12, 9),
        // plimmin: PLIMMIN(0, 0),
        // plinegen: PLINEGEN.continuousPatternAroundVertices,
        // plinewid: PLINEWID(0),
        // psltscale: PSLTSCALE.viewportBasedScaling,
        // pucsname: PUCSNAME(''),
        // pucsorg: PUCSORG(0, 0, 0),
        // pucsxdir: PUCSXDIR(0, 0, 0),
        // pucsydir: PUCSYDIR(0, 0, 0),
        // qtextmode: QTEXTMODE(0),
        // regenmode: REGENMODE(1),
        // shadedge: SHADEDGE.facesInEntityColorEdgesInBlack,
        // shadedif: SHADEDIF.defaultValue,
        // sketchinc: SKETCHINC(0.1),
        // skpoly: SKPOLY.generateLines,
        // splframe: SPLFRAME.disableSplineFrameDisplay,
        // splinesegs: SPLINESEGS(8),
        // splinetype: SPLINETYPE(6), //FIXME check docs
        // surftab1: SURFTAB1(6),
        // surftab2: SURFTAB2(6),
        // surftype: SURFTYPE(6),
        // surfu: SURFU(6),
        // surfv: SURFV(6),
        // tdcreate: TDCREATE(DateTime.now()), //FIXME check docs
        // tdindwg: TDINDWG(0), //FIXME check docs
        // tdupdate: TDUPDATE(DateTime.now()), //FIXME check docs
        // tdusrtimer: TDUSRTIMER(0), //FIXME check docs
        // textsize: TEXTSIZE(0.2),
        // textstyle: TEXTSTYLE(TextStyle.standard),
        // thickness: THICKNESS(0),
        // tilemode: TILEMODE.previousCompatible,
        // tracewid: TRACEWID(0.05),
        // ucsname: UCSNAME(''),
        // ucsorg: UCSORG(0, 0, 0),
        // ucsxdir: UCSXDIR(0, 0, 0),
        // ucsydir: UCSYDIR(0, 0, 0),
        // unitmode: UNITMODE(0),
        // useri1: USERI1(0),
        // useri2: USERI2(0),
        // useri3: USERI3(0),
        // useri4: USERI4(0),
        // useri5: USERI5(0),
        // userr1: USERR1(0),
        // userr2: USERR2(0),
        // userr3: USERR3(0),
        // userr4: USERR4(0),
        // userr5: USERR5(0),
        // usrtimer: USRTIMER.timerOn,
        // visretain: VISRETAIN.retainSettings,
        // worldview: WORLDVIEW.setUcsToWcs,
      );
}
