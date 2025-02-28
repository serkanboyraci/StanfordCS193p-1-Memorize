//
//  ContentView.swift
//  StanfordCS193p-1-Memorize
//
//  Created by Ali serkan Boyracı  on 28.11.2024.
//

import SwiftUI

struct ContentView: View { //1 ContentView behaves like a View
   // tek tek asagida yazmaktansa hepsini bir array icine koyduk.
    // Array<String> yazamaktansa [String] yazmak daha mantikli, bu arada hic yazmasanda olur.

     
    //@State var cardCount : Int = 20
    
  
    let title = Text("Memorize!").font(.largeTitle).bold()
    
    @State var emojis: [String] = ["😍","🥰","😘","😀","😃","😅","😛","🥸","🤪","😎", "😍","🥰","😘","😀","😃","😅","😛","🥸","🤪","😎"]
    
   
    
    var body: some View { //3 some = herhangi bir view = ne olursa olsun goster demek gibi.
        // 20 burda someView yazinca bizim yerimize TupleView yaziyor eger sadece some View yerine Text yazip icine text(...) biseyler yazsaydik sadece text cikardi. Eger 2 tane alt alta ya da yana yana text kullanacaksak some View kullanmak zorundayiz.
        
        
        
        //VStack { // 29 bu sekilde saginda solunda guzel olmadi asagiya almak icin Vstack kullaniriz.
            
            /*title
            HStack {
                themeAdjuster1
                Spacer()
                themeAdjuster2
                Spacer()
                themeAdjuster3
            }.imageScale(.large)
                .font(.largeTitle)
                .padding()*/
            ScrollView { // 29.9 cardlari asagiya kaydirmka icin gerekli!!!!
                cards
            }
            .padding()
            
            //Spacer() // 29.4 buraya spacer koyu nca tum griditemlar en uste gitti.
           // cardCountAdjuster // 29 HERSEYI VAR ICLERINE KOYUP YAPTIK!!!!!!
        
            /*
            CardView(content: emojis[0], isFaceUp: false)
            CardView(content: emojis[1], isFaceUp: false) // 24 eger carview struct inda tanimlarsak burda tekrar tanimlamaya gerek yok
            CardView(content: emojis[2], isFaceUp: true)
            CardView(content: emojis[3], isFaceUp: false)*/
        
        /* ZStack(content: { // Vstack altli ustlu olmasini sagliyor
            // Zstack ayni dikez duzlemde olmasini sagliyor
            //2  burdan padding sonuna kadar property dye gecer
            // 6. content onuce ve padding oncesine parantez ekleyerek, Vstack icerigini belirttik.
            // 5. aslinda burda 3 tane struct var birisi image digeri text sonuncusu da Vstack, Vstack() acilip icerisi degistirilebilir.
           // Image(systemName: "globe")// 4 creating image struct, //6 systemName: systemde kayitli olan bir imagei cagiriyor. imageNamed olsaydi assetlerden bakacaktik.
            
            
            
            RoundedRectangle(cornerRadius: 15)
                .foregroundColor(.white) // 9. arka plani beyaz yapmak icin gerekli ancak hem foreground hemde storl ayni anda olmuyor o yuzden bir tane daha rectangle olusutuyoruz.
            RoundedRectangle(cornerRadius: 15)// 8.wir müssen cornerradius geben.
                            .strokeBorder(lineWidth: 3) // 9.kenarik icin
            
            Text("🥶").font(.largeTitle)
                
        })*/
        //.foregroundColor(Color.orange) // 7 functions to change color
        //.imageScale(.large) //7/ functions to make large
        //.foregroundStyle(.tint)
        //5 creating text struct
        
    }
    
    // 29 burda upuzun kartlar yapmak yerine bunlari kare kare yapilabilir.
    // bunu LAzyVGrid ile yapacagiz.
    var cards: some View { //burda {} arasi Viewbuilder degil sadece normal func, we dont need return here!!!!!!
        LazyVGrid(columns: [GridItem(.adaptive(minimum:90, maximum: 100))]) { // burda griditem() ayrica koseli parantez icine yaziliyor. kac tane grid item isterseniz hepsni belritmeniz gerekli
            // basta [GridItem(), GridItem(), GridItem()] bu sekilde belirtmistik ama yerine
            // [GridItem(.adaptive(minimum: ve max belirtebilirsin.
            // ancak tum sirayi kapali yapinca incecik oluyor sebebi de LAZYGRID hep olabildigince kucuk olmak istiyor. buna cozum bulunmali BUNA COZUM olarak Zstack da Group kullanacagiz
            // HSTACK OLABILDIGI KADAR BUYU ALAN KULLANIRKEN
            // LAZYVGRID OLABILIDIG KADAR KUCUK ALAN KULLANIR.
            ForEach(emojis.indices, id: \.self) { index in // for loop gibi ama fro each ile her view i gormemizi sagliyor.
                //ardindan { ile closure ypip her view icine bunu koy diyoruz. ve kapatiyoruz.}
                // (0..<4 = 0...5 = emojis.indices en guzeli souncusu eklendikce otomatik degisir. //4 ten 7 yaptim otomatik artti.
                // 28 bu kadar otomatik olunca cok fazla emojiyi ayni anda gormek istemyourm onun icin bir varibale atamak daha mantikli
                CardView(content: emojis[index])  //isFaceUp i default olarak birakiyoruz
                    .aspectRatio(2/3, contentMode: .fit) // card 2/3
                //gorunumleri ayarlamak icin
                //.fit space available ise uyguluyor
                
            }
            .foregroundColor(Color.orange)
        }
    }
    /*var themeAdjuster1 : some View {
        Button(action: {
            emojis = ["🇹🇷","🇦🇿","🇺🇸","🇦🇺","🇩🇪","🇷🇺","🇨🇦","🇭🇷","🇦🇱","🇪🇸","🇹🇷","🇦🇿","🇺🇸","🇦🇺","🇩🇪","🇷🇺","🇨🇦","🇭🇷","🇦🇱","🇪🇸"]
            
        }, label: { Image(systemName: "flag.pattern.checkered")
        })

    }
    var themeAdjuster2 : some View {
        Button(action: {
            emojis = ["🍏","🍐","🍊","🍌","🍉","🍇","🍓","🫐","🍒","🍍","🍏","🍐","🍊","🍌","🍉","🍇","🍓","🫐","🍒","🍍"]
        }, label: { Image(systemName: "carrot")
        })
    }
    var themeAdjuster3 : some View {
        Button(action: {
            emojis = ["⚽️","🏀","🎱","🥋","🛷","🏊🏻‍♂️","🪁","🛝","🎾","⛳️","⚽️","🏀","🎱","🥋","🛷","🏊🏻‍♂️","🪁","🛝","🎾","⛳️"]
            
        }, label: { Image(systemName: "soccerball")
        })
    }
    
    

    
    var cardCountAdjuster : some View {
        HStack { //29 butonlari yan yana yapmak icin yine Hstack kullaniriz
            
            cardRemover
            Spacer() //ayri durmasi icin
            cardAdder
        }
        .imageScale(.large)
        .font(.largeTitle)
        .padding() // etafina cerceve gibi yer acmak icin padding kullaniriz.
    }
    
    func cardCountAdjuster( offset: Int, symbol: String) -> some View { //by offset ile offset yazman arasinda fark yok.
        Button(action: {
            cardCount += offset
        }, label: {
            Image(systemName :symbol)
                
        })
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count) // son rakamdan kucuk olursa or buyuk olursa disabled yapiyor.
    }
    
    var cardRemover : some View {
        cardCountAdjuster(offset: -1, symbol: "rectangle.stack.fill.badge.minus")
        // by offset yazarsan burda offset yerine sadece by yazabilirsin.birisi external name digeri internal name
    }
    var cardAdder : some View {
        cardCountAdjuster(offset: +1, symbol: "rectangle.stack.fill.badge.plus")
    }
    
    */
    /*
    
    var cardRemover : some View { // 29 ADDER VE REMOVER BIRBIRINE BENZIYOR, BURAYI BIRBIRINE BENZETELIM.
     // 28 BUTONU DEGISKENE VERIP SOMEVIEW OLARAK YAZMAK.
        Button(action: {
            if cardCount > 1 {// kartlar min ya da max sayisi gecince crash oluyor engellemek icin if koyacagiz
                cardCount -= 1
            }
        }, label: {
            Image(systemName :"rectangle.stack.fill.badge.minus")
        })
        .imageScale(.large)
        .font(.largeTitle)
    }
    
    var cardAdder : some View {
        Button(action: {
            if cardCount < emojis.count { // buraya uyari konulur
                cardCount += 1
            }
        }, label: {
            Image(systemName :"rectangle.stack.fill.badge.plus")
        })
        .imageScale(.large)
        .font(.largeTitle)
        /*Button("Add Card") { bu buttonlar sadece yaziyla pek hos gozukmuyor onun yerine buraya sembol koymak daha iyi
         cardCount += 1
         }
         Spacer() // birbirinden ayirmak icin
         Button("Remove Card") {
         cardCount -= 1
         } */
    } */
}

struct CardView : View {
    let content : String // content tipi degismesin
    @State var isFaceUp : Bool = true // burayi let yapamazsin // burda da Bool yazmana gerek yok// @State burayi pointer yapiyor.Hersey degisse bile burasi degismiyor.
    
    var body: some View {
        ZStack { // 21 Zstack (.alignment: .top yazarak-.center merkeze alir icerigi yukariya alabilirsin. 23 center yazmana gerek yok zaetn default o sekilde. o yuzden siliyourz
            // 23 bos parantezi de eger trailing closure varsa silebilirsin.
            //22 burda alignment den sonra content vardi ama herhengi bir icerigi yoktu o yuzden bulnamsina gerek yok
            let shape = RoundedRectangle(cornerRadius: 15) // burayi let yapmak daha mantikli // burda basta type olarak yani basina : koyarak typ ini bildirmistik ancak gerek yok, zaten esittir yapinca o type inference ile kendisi anliyor.
            Group { // burda her birisine ayri bir islem uygulaniyor ForEachOne gibi
                shape.fill(.white)
                shape.strokeBorder(lineWidth :2)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0) // eger faceup 1 ise gorunmez yap, 0 ise 1 yap
            shape.fill().opacity(isFaceUp ? 0 : 1) //0 transparent 1 is opak
            // bu sefer lazyVgrid kuculmedi cunku emoji hala orda sadece gornum opak oldu.
            
            
            /* eski kod buydu ama burda LAzyVgrid ile kucuk inceceik oluyorlardi.
             if  isFaceUp {
                shape.fill(.white)
                shape.strokeBorder(lineWidth :2)
                Text(content).font(.largeTitle)
             } else {
             shape.fill()
             }
             
             
             */
            
                /* RoundedRectangle(cornerRadius: 15) // 25 burdaki gibi surekli ayni seyi yazmaktansa bir Roundedrectangle durumunu bir degiskene atamaliyiz.
                    .fill(.white)
                RoundedRectangle(cornerRadius: 15)// 8.wir müssen cornerradius geben.
                    .strokeBorder(lineWidth: 3)
                Text("🥶").font(.largeTitle)
            } else {
                RoundedRectangle(cornerRadius: 15)// .fill yazmaya gerek yok zaten default geliyor.
                }*/
        }  
        .onTapGesture(count:1) { //(count:2) eklersen 2 defa tikladiginda calisir.
            // print("Tapperrrr") great way to control the code.
            // isFaceUp = !isFaceUp // 26 yukariya var basina @State koyarak onu pointer yapiyoruz bu sekilde o degismiyor ancak burayai degistirme yetkimiz oluyor.
            isFaceUp.toggle() // 27 yukardakinin Bool icin kolay yazma yontemi burasi onemli// toggle Falseu True yada tamtersini yapar.
        }
    }
}


#Preview {
    ContentView()
}

