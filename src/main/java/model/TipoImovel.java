package model;

public class TipoImovel {
	
	private int id_imovel;	
	private String nome_tpimovel;
	
	public int getId_imovel() {
		return id_imovel;
	}
	public void setId_imovel(int id_imovel) {
		this.id_imovel = id_imovel;
	}
	public String getNome_tpimovel() {
		return nome_tpimovel;
	}
	public void setNome_tpimovel(String nome_tpimovel) {
		this.nome_tpimovel = nome_tpimovel;
	}
	
	@Override
	public String toString() {
		return "TipoImovel [id_imovel=" + id_imovel + ", nome_tpimovel=" + nome_tpimovel + "]";
	}

	
}
