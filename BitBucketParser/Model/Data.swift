/// Copyright (c) 2021 YANBO TAO
/// 
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
/// 
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
/// 
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
/// 
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

/*
 "scm":"git",
 "website":"",
 "has_wiki":false,
 "uuid":"{3f630668-75f1-4903-ae5e-8ea37437e09e}",
 "links":{
 "watchers":{
 "href":"https://api.bitbucket.org/2.0/repositories/opensymphony/xwork/watchers"
 },
 "branches":{
 "href":"https://api.bitbucket.org/2.0/repositories/opensymphony/xwork/refs/branches"
 },
 "tags":{
 "href":"https://api.bitbucket.org/2.0/repositories/opensymphony/xwork/refs/tags"
 },
 "commits":{
 "href":"https://api.bitbucket.org/2.0/repositories/opensymphony/xwork/commits"
 },
 "clone":[
 {
 "href":"https://bitbucket.org/opensymphony/xwork.git",
 "name":"https"
 },
 {
 "href":"git@bitbucket.org:opensymphony/xwork.git",
 "name":"ssh"
 }
 ],
 "self":{
 "href":"https://api.bitbucket.org/2.0/repositories/opensymphony/xwork"
 },
 "source":{
 "href":"https://api.bitbucket.org/2.0/repositories/opensymphony/xwork/src"
 },
 "html":{
 "href":"https://bitbucket.org/opensymphony/xwork"
 },
 "avatar":{
 "href":"https://bytebucket.org/ravatar/%7B3f630668-75f1-4903-ae5e-8ea37437e09e%7D?ts=java"
 },
 "hooks":{
 "href":"https://api.bitbucket.org/2.0/repositories/opensymphony/xwork/hooks"
 },
 "forks":{
 "href":"https://api.bitbucket.org/2.0/repositories/opensymphony/xwork/forks"
 },
 "downloads":{
 "href":"https://api.bitbucket.org/2.0/repositories/opensymphony/xwork/downloads"
 },
 "pullrequests":{
 "href":"https://api.bitbucket.org/2.0/repositories/opensymphony/xwork/pullrequests"
 }
 },
 "fork_policy":"allow_forks",
 "full_name":"opensymphony/xwork",
 "name":"xwork",
 "project":{
 "links":{
 "self":{
 "href":"https://api.bitbucket.org/2.0/workspaces/opensymphony/projects/PROJ"
 },
 "html":{
 "href":"https://bitbucket.org/opensymphony/workspace/projects/PROJ"
 },
 "avatar":{
 "href":"https://bitbucket.org/account/user/opensymphony/projects/PROJ/avatar/32?ts=1543460518"
 }
 },
 "type":"project",
 "name":"Untitled project",
 "key":"PROJ",
 "uuid":"{57fac509-0df2-47ce-ad8e-27be013523fa}"
 },
 "language":"java",
 "created_on":"2011-06-06T03:40:09.505792+00:00",
 "mainbranch":{
 "type":"branch",
 "name":"master"
 },
 "workspace":{},
 "has_issues":false,
 "owner":{
 "display_name":"opensymphony",
 "uuid":"{cedfd0d1-899f-49de-acf7-a2fa8e924b6f}",
 "links":{
 "self":{
 "href":"https://api.bitbucket.org/2.0/users/%7Bcedfd0d1-899f-49de-acf7-a2fa8e924b6f%7D"
 },
 "html":{
 "href":"https://bitbucket.org/%7Bcedfd0d1-899f-49de-acf7-a2fa8e924b6f%7D/"
 },
 "avatar":{
 "href":"https://bitbucket.org/account/opensymphony/avatar/"
 }
 },
 "type":"user",
 "nickname":"opensymphony",
 "account_id":null
 },
 "updated_on":"2014-11-16T23:19:16.674082+00:00",
 "size":22877949,
 "type":"repository",
 "slug":"xwork",
 "is_private":false,
 "description":""
 */


struct LinksSelf:Decodable{
  let href:String
  init(json: [String:Any]) {
      href = json["href"] as? String ?? ""
  }
}
struct LinksHtml:Decodable{
  let href:String
  init(json: [String:Any]) {
      href = json["href"] as? String ?? ""
  }
}
struct LinksAvatar:Decodable{
  let href:String
  init(json: [String:Any]) {
      href = json["href"] as? String ?? ""
  }
}


struct Links : Decodable {
  var link_self:LinksSelf
  var link_html:LinksHtml
  var avatar:LinksAvatar
  
  init(json: [String:Any]) {
      link_self = (json["self"] as? LinksSelf)!
     link_html = (json["html"] as? LinksHtml)!
      avatar = (json["avatar"] as? LinksAvatar)!
  }
  enum CodingKeys: String, CodingKey {
    case link_self = "self"
    case link_html = "html"
    case avatar = "avatar"
  }
}

struct Owner: Decodable {
  var uuid:String
  var display_name: String
  var type: String
  var links: Links

  init(json: [String:Any]) {
      uuid = json["uuid"] as? String ?? ""
      display_name = json["display_name"] as? String ?? ""
      type = json["type"] as? String ?? ""
      links = (json["links"] as? Links)!
  }
}

struct Watchers:Decodable{
  let href:String
  init(json: [String:Any]) {
      href = json["href"] as? String ?? ""
  }
}

struct Branches:Decodable{
  let href:String
  init(json: [String:Any]) {
      href = json["href"] as? String ?? ""
  }
}

struct Tags:Decodable{
  let href:String
  init(json: [String:Any]) {
      href = json["href"] as? String ?? ""
  }
}

struct Commits:Decodable{
  let href:String
  init(json: [String:Any]) {
      href = json["href"] as? String ?? ""
  }
}






//Show the display name, type, the date of creation and avatar of the owner
struct Data: Decodable {
  
  let uuid : String
  let full_name : String
  let language : String
  let createDate: String
  
  let owner : Owner
 
  
  enum CodingKeys: String, CodingKey {
    case uuid
    case createDate = "created_on"
    case full_name
    case language
    case owner
  
  }
}

extension Data: Displayable {
  
  var titleLabelText: String {
    
    owner.display_name
  }
  
  var subtitleLabelText: String {
    owner.type
  }
  
  
  
  var createdDate: (label: String, value: String) {
    ("CREATE_DATE", createDate)
  }
  
  var avatar: String {
    owner.links.avatar.href
  }
  
  var item1: (label: String, value: String) {
    ("UUID", uuid)
  }
  
  var item2: (label: String, value: String) {
    ("FULL NAME", full_name)
  }
  
  var item3: (label: String, value: String) {
    ("LANGUAGE", language)
  }
 
  var list1: String {
    "self:\(owner.links.link_self.href) "
  }
  var list2: String {
    "html:\(owner.links.link_html.href) "
  }
  var list3: String {
    "avatar:\(owner.links.avatar.href) "
  }
  
}
