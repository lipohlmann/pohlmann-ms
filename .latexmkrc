# 4 is lualatex
$pdf_mode = 4; 
$lualatex = 'lualatex -shell-escape -interaction=nonstopmode %O %S';
$biber = 'biber %O %S';
$clean_ext = 'aux bbl bcf blg fls log nav out run.xml snm synctex.gz toc';
# glossaries: run makeglossaries when .glo/.acn change
add_cus_dep('glo', 'gls', 0, 'run_makeglossaries');
add_cus_dep('acn', 'acr', 0, 'run_makeglossaries');
sub run_makeglossaries {
    my ($base, $path) = fileparse($_[0]);
    pushd $path;
    my $return = system "makeglossaries", $base;
    popd;
    return $return;
}
push @generated_exts, 'glo', 'gls', 'glg', 'acn', 'acr', 'alg', 'ist';
