(() => {
  const input = document.getElementById("filter");
  const apply = () => {
    const query = input.value.trim().toLowerCase();
    let shown = 0;
    for (const group of document.querySelectorAll(".group")) {
      group.hidden = query !== "" && !group.dataset.key.includes(query);
      if (!group.hidden) shown++;
    }
    const none = document.getElementById("nomatch");
    if (none) none.hidden = shown !== 0;
  };
  input.value = new URLSearchParams(location.search).get("q") || "";
  input.addEventListener("input", apply);
  apply();
})();
