package model;

public class Estagio {
	
	private int idestagio;	
	private String nome_estagio;
	public int getIdestagio() {
		return idestagio;
	}
	public void setIdestagio(int idestagio) {
		this.idestagio = idestagio;
	}
	public String getNome_estagio() {
		return nome_estagio;
	}
	public void setNome_estagio(String nome_estagio) {
		this.nome_estagio = nome_estagio;
	}
	
	@Override
	public String toString() {
		return "Estagio [idestagio=" + idestagio + ", nome_estagio=" + nome_estagio + "]";
	}
	

}
