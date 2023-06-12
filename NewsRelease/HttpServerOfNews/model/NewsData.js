class NewsData {
  constructor(id, title, content, imagesUrl, source) {
    this.id = id;
    this.title = title;
    this.content = content;
    this.imagesUrl = imagesUrl;
    this.source = source;
  }
}

module.exports = NewsData;