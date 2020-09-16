require 'colorize'

class Test
  def initialize(definicion_test)
    @definicion_test = definicion_test
  end

  def ejecutar
    @fail_proc = proc { return :fail }
    instance_eval(&@definicion_test)
    :pass
  end

  def assert(a_boolean)
    @fail_proc.call unless a_boolean
  end
end

class TestSuite
  def initialize(notificar_resultados: false, &definicion_suite)
    @notificar_resultados = notificar_resultados
    @tests = []
    instance_eval(&definicion_suite)
  end

  def ejecutar
    @tests.each do |test|
      resultado = test.ejecutar

      notificar_resultado(resultado) if @notificar_resultados
    end
  end

  def test(&definicion_test)
    @tests << Test.new(definicion_test)
  end

  private

  def notificar_resultado(resultado)
    if resultado == :pass
      puts "PASS".green
    else
      puts "FAIL".red
    end
  end
end

def test_suite(&definicion_suite)
  la_suite = TestSuite.new(notificar_resultados: true, &definicion_suite)
  la_suite.ejecutar
end
