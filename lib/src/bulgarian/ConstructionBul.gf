concrete ConstructionBul of Construction = CatBul ** 
  open ParadigmsBul, (R=ResBul), Prelude, SyntaxBul, SymbolicBul, ExtraBul, MorphoFunsBul in {

flags
  coding=utf8;

lincat
  Weekday = N ;
  Monthday = NP ;
  Month = N ; 
  Year = NP ;
  Language = N ;

lin
  hungry_VP = mkVP (mkA079 "гладен") ;
  thirsty_VP = mkVP (mkA079 "жаден") ;
  has_age_VP card = mkVP (SyntaxBul.mkAdv (mkPrep "на" R.Acc) (mkNP <lin Card card : Card> (mkN041 "година"))) ;
  have_name_Cl x name = mkCl <lin NP x : NP> (dirV2 (medialV (actionV (mkV186 "казвам") (mkV156 "кажа")) R.Acc)) <lin NP name : NP> ;
  how_old_QCl p = mkQCl (MorphoFunsBul.mkIAdv "на колко") (mkCl <lin NP p : NP> (mkNP a_Quant plNum (mkN041 "година"))) ;
  how_far_QCl name = mkQCl (ExtraBul.IAdvAdv (ss "далече")) name ;
  married_Cl p1 p2 = mkCl <lin NP p1 : NP> 
                         (mkVP (mkVP (mkA076 (case p1.a.gn of {
                                                R.GSg R.Fem => "омъжен" ;
                                                _           => "женен"
                                              }))) (SyntaxBul.mkAdv (mkPrep "за" R.Acc) <lin NP p2 : NP>));
  what_name_QCl	p = mkQCl how_IAdv (mkCl <lin NP p : NP> (medialV (actionV (mkV186 "казвам") (mkV156 "кажа")) R.Acc)) ;
  is_right_VP = mkVP (mkA084 "верен") ;
  is_wrong_VP = mkVP (mkA079 "грешен") ;
  n_units_AP card cn a = mkAP (lin AdA (mkUtt (mkNP <lin Card card : Card> (lin CN cn)))) (lin A a) ;
  weather_adjCl a = R.mkClause (a.s ! R.ASg R.Masc R.Indef) {gn=R.GSg R.Masc; p=R.P3} R.Pos (R.insertObj (\\_=>"") R.Pos (R.predV R.verbBe)) ;

lin
  weekdayPunctualAdv w = SyntaxBul.mkAdv in_Prep (mkNP w) ;         -- on Sunday
  weekdayHabitualAdv w = SyntaxBul.mkAdv in_Prep (mkNP thePl_Det w) ; -- on Sundays
  weekdayNextAdv w = {s = (mkNP theSg_Det (mkCN (mkA076 "следващ") w)).s ! R.RSubj} ;     -- next Sunday
  weekdayLastAdv w = {s = (mkNP theSg_Det (mkCN (mkA076 "минал") w)).s ! R.RSubj} ;     -- last Sunday

  monthAdv m = SyntaxBul.mkAdv (mkPrep "през" R.Acc) (mkNP m) ;
  yearAdv y = SyntaxBul.mkAdv (mkPrep "през" R.Acc) y ;
  dayMonthAdv d m = {s="на" ++ d.s ! R.RSubj ++ m.s ! R.NF R.Sg R.Indef} ; -- on 17 May
  monthYearAdv m y = SyntaxBul.mkAdv (mkPrep "през" R.Acc) (mkNP (mkCN m y)) ; -- in May 2012
  dayMonthYearAdv d m y = {s="на" ++ d.s ! R.RSubj ++ m.s ! R.NF R.Sg R.Indef ++ y.s ! R.RSubj} ; -- on 17 May 2013

  intYear = symb ;
  intMonthday = symb ;

lin
  InLanguage l = SyntaxBul.mkAdv on_Prep (mkNP l) ;
  languageCN l = mkCN l ;
  languageNP l = mkNP l ;

lin
  weekdayN w = w ;
  monthN m = m ;

  weekdayPN w = mkPN (w.s ! R.NF R.Sg R.Indef) 
                     (case w.g of {
                        R.AMasc _       => R.Masc ;
                        R.AFem          => R.Fem ;
                        R.ANeut         => R.Neut
                      }) ;
  monthPN m = mkPN (m.s ! R.NF R.Sg R.Indef) R.Masc ;

lin
  bottle_of_CN np = {s = \\nf => (mkN041 "бутилка").s ! nf ++ np.s ! R.RSubj; g=R.AFem} ;
  cup_of_CN    np = {s = \\nf => (mkN041 "чаша").s ! nf ++ np.s ! R.RSubj; g=R.AFem} ;
  glass_of_CN  np = {s = \\nf => (mkN041 "чаша").s ! nf ++ np.s ! R.RSubj; g=R.AFem} ;

lin
  monday_Weekday = dualN (mkN014 "понеделник") (mkA079 "понеделничен") ;
  tuesday_Weekday = dualN (mkN014 "вторник") (mkA079 "вторничен") ;
  wednesday_Weekday = mkN041 "сряда" ;
  thursday_Weekday = dualN (mkN014 "четвъртък") (mkA079 "четвъртъчен") ;
  friday_Weekday = dualN (mkN014 "петък") (mkA079 "петъчен") ;
  saturday_Weekday = dualN (mkN041 "събота") (mkA079 "съботен") ;
  sunday_Weekday = dualN (mkN047 "неделя") (mkA079 "неделен") ;

  january_Month = mkMonth "януари" "януарски" ;
  february_Month = mkMonth "февруари" "февруарски" ;
  march_Month = mkMonth "март" "мартовски" ;
  april_Month = mkMonth "април" "априлски" ;
  may_Month = mkMonth "май" "майски" ;
  june_Month = mkMonth "юни" "юнски" ;
  july_Month = mkMonth "юли" "юлски" ;
  august_Month = mkMonth "август" "августовски" ;
  september_Month = mkMonth "септември" "септемврийски" ;
  october_Month = mkMonth "октомври" "октомврийски" ;
  november_Month = mkMonth "ноември" "ноемврийски" ;
  december_Month = mkMonth "декември" "декемврийски" ;

lin
  afrikaans_Language = mkN007 "африканс";
  amharic_Language = substantiveN (mkA078 "амхарски") (AMasc NonHuman);
  arabic_Language = substantiveN (mkA078 "aрабски") (AMasc NonHuman);
  bulgarian_Language = substantiveN (mkA078 "български") (AMasc NonHuman)
  catalan_Language = substantiveN (mkA078 "каталунски") (AMasc NonHuman)
  chinese_Language = substantiveN (mkA078 "китайски") (AMasc NonHuman)
  danish_Language = substantiveN (mkA078 "датски") (AMasc NonHuman)
  dutch_Language = substantiveN (mkA078 "холандски") (AMasc NonHuman)
  english_Language = substantiveN (mkA078 "английски") (AMasc NonHuman)
  estonian_Language = substantiveN (mkA078 "естонски") (AMasc NonHuman)
  finnish_Language = substantiveN (mkA078 "финландски") (AMasc NonHuman)
  french_Language = substantiveN (mkA078 "френски") (AMasc NonHuman)
  german_Language = substantiveN (mkA078 "немски") (AMasc NonHuman)
  greek_Language = substantiveN (mkA078 "гръцки") (AMasc NonHuman)
  hebrew_Language = substantiveN (mkA078 "еврейски") (AMasc NonHuman)
  hindi_Language = mkN065 "хинди";
  japanese_Language = substantiveN (mkA078 "японски") (AMasc NonHuman)
  italian_Language = substantiveN (mkA078 "италиянски") (AMasc NonHuman)
  latin_Language = substantiveN (mkA078 "латински") (AMasc NonHuman)
  latvian_Language = substantiveN (mkA078 "латвийски") (AMasc NonHuman)
  maltese_Language = substantiveN (mkA078 "малтийски") (AMasc NonHuman)
  nepali_Language = substantiveN (mkA078 "непалски") (AMasc NonHuman)
  norwegian_Language = substantiveN (mkA078 "норвежки") (AMasc NonHuman)
  persian_Language = substantiveN (mkA078 "персийски") (AMasc NonHuman)
  polish_Language = substantiveN (mkA078 "полски") (AMasc NonHuman)
  punjabi_Language = mkN065 "пънджаби";
  romanian_Language = substantiveN (mkA078 "румънски") (AMasc NonHuman)
  russian_Language = substantiveN (mkA078 "руски") (AMasc NonHuman)
  sindhi_Language = mkN065 "синди";
  spanish_Language = substantiveN (mkA078 "испански") (AMasc NonHuman)
  swahili_Language = mkN065 "суахили";
  swedish_Language = substantiveN (mkA078 "шведски") (AMasc NonHuman)
  thai_Language = substantiveN (mkA078 "тайландски") (AMasc NonHuman)
  turkish_Language = substantiveN (mkA078 "турски") (AMasc NonHuman)
  urdu_Language = mkN065 "урду";

oper 
  mkMonth : Str -> Str -> N = \n,a -> lin N {
    s = \\_ => n ;
    rel = (mkA078 a).s ;
    g = R.AMasc R.NonHuman
  } ;
}
