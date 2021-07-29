import UIKit

// Enumerations

// enum -> 타입 분류

// 도서관 -> 항목 -> 소설, 문제집, 패션, 만화책..

// 분류만 하고 싶은 경우
enum booktype
{
    case fiction(title: String, price: Int, year: Int)
    case comics(title: String, price: Int, year: Int)
    case workbook(title: String, price: Int, year: Int)
    // ...
}

extension booktype
{
    var typename: String {
        switch self {
        case .comics:
            return ("comics")
        case .fiction:
            return ("fiction")
        case .workbook:
            return ("workbook")
        default:
            return ("")
        }
    }
}

var bookstyle: booktype?

var books = [booktype]()

func save(book: booktype)
{
        // 저장하는 로직
        books.append(book)
}
/*func load(book: booktype) -> [booktype]
{
    var tmp = [booktype]()
    
    for item in books
    {
        if (item == book)
        {
            tmp.append(item)
        }
    }
    return tmp
}
 */
save(book: .comics(title: "aaa", price: 12000, year: 2021))
save(book: .fiction(title: "bbb", price: 12001, year: 2022))
save(book: .workbook(title: "ccc", price: 12002, year: 2023))

save(book: .comics(title: "ddd", price: 12003, year: 2024))
save(book: .fiction(title: "eee", price: 12004, year: 2025))
save(book: .workbook(title: "fff", price: 12005, year: 2026))

for book in books
{
    if case let booktype.comics(title, _, _) = book {
        print(title, book.typename)
    }
    
    if case let booktype.fiction(title, _, _) = book {
        print(title, book.typename)
    }
    
   /* switch book {
    case let .comics(_, price, _):
        print(price)
    case let .fiction(title, _, _):
        print(title)
    default:
        break
    }*/
}
books
