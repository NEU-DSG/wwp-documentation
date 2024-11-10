module.exports = function(eleventyConfig) {
  // Order matters, put this at the top of your configuration file.
  eleventyConfig.setInputDirectory("pages");
  eleventyConfig.setFrontMatterParsingOptions({
    delimiters: ["<?eleventy", "?>"],
    language: "json"
  });
};