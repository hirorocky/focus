export default {
  data: function () {
    return {
      fragments: [],
      recent_id: -1,
      input_content: "",
      input_tag: "",
      input_context: "",
    };
  },
  methods: {
    subscribe: function (event) {
      this.fragments.push({
        tag: this.input_tag,
        content: this.input_content,
        id: this.nextId()
      });
    },
    nextId: function () {
      return ++this.recent_id;
    },
    onTagSuggestClicked: function (event) {
      this.input_tag = event.target.text;
    },
    deleteFragment: function (fragment) {
      const index = this.fragments.indexOf(fragment);
      this.fragments.splice(index, 1);
    }
  }
}