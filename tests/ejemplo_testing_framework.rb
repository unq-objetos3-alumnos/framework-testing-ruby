require_relative '../lib/testing_framework'

test_suite do
  test do
    lista_vacia = []

    assert lista_vacia.empty?
  end

  test do
    un_caracter = "x"

    cinco_veces = un_caracter * 5

    assert cinco_veces.size == 5
  end
end
